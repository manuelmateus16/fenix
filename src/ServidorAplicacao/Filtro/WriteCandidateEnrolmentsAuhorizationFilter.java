package ServidorAplicacao.Filtro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import DataBeans.InfoRole;
import Dominio.CurricularCourseScope;
import Dominio.ICurricularCourseScope;
import Dominio.IMasterDegreeCandidate;
import Dominio.ITeacher;
import Dominio.MasterDegreeCandidate;
import ServidorAplicacao.IServico;
import ServidorAplicacao.IUserView;
import ServidorAplicacao.Servico.exceptions.NotAuthorizedException;
import ServidorPersistente.ExcepcaoPersistencia;
import ServidorPersistente.OJB.SuportePersistenteOJB;
import Util.RoleType;

/**
 * 
 * @author Nuno Nunes (nmsn@rnl.ist.utl.pt)
 * @author Joana Mota (jccm@rnl.ist.utl.pt)
 */
public class WriteCandidateEnrolmentsAuhorizationFilter extends Filtro {

	public final static WriteCandidateEnrolmentsAuhorizationFilter instance =
		new WriteCandidateEnrolmentsAuhorizationFilter();

	/**
	 * The singleton access method of this class.
	 *
	 * @return Returns the instance of this class responsible for the
	 * authorization access to services.
	 **/
	public static Filtro getInstance() {
		return instance;
	}

	public void preFiltragem(IUserView id, IServico servico, Object[] argumentos)
		throws Exception {

		if ((id != null && id.getRoles() != null && !containsRole(id.getRoles()))
			|| (id != null && id.getRoles() != null && !hasPrivilege(id, argumentos))
			|| (id == null)
			|| (id.getRoles() == null)) {
			throw new NotAuthorizedException();
		}
	}

	/**
	 * @param collection
	 * @return boolean
	 */
	private boolean containsRole(Collection roles) {
		CollectionUtils.intersection(roles, getNeededRoles());

		if (roles.size() != 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @return The Needed Roles to Execute The Service
	 */
	private Collection getNeededRoles() {
		List roles = new ArrayList();

		InfoRole infoRole = new InfoRole();
		infoRole.setRoleType(RoleType.MASTER_DEGREE_ADMINISTRATIVE_OFFICE);
		roles.add(infoRole);

		infoRole = new InfoRole();
		infoRole.setRoleType(RoleType.COORDINATOR);
		roles.add(infoRole);

		return roles;
	}

	/**
	 * @param id
	 * @param argumentos
	 * @return  
	 */
	private boolean hasPrivilege(IUserView id, Object[] arguments) throws ExcepcaoPersistencia {

		List roles = getRoleList((List) id.getRoles());
		CollectionUtils.intersection(roles, getNeededRoles());

		SuportePersistenteOJB sp = SuportePersistenteOJB.getInstance();

		List roleTemp = new ArrayList();
		roleTemp.add(RoleType.MASTER_DEGREE_ADMINISTRATIVE_OFFICE);
		if (CollectionUtils.containsAny(roles, roleTemp)) {
			return true;
		}

		roleTemp = new ArrayList();
		roleTemp.add(RoleType.COORDINATOR);
		if (CollectionUtils.containsAny(roles, roleTemp)) {

			ITeacher teacher = null;
			// Read The ExecutionDegree
			try {

				Integer selection[] = (Integer[]) arguments[0];
				Integer candidateID = (Integer) arguments[1];
				teacher = sp.getIPersistentTeacher().readTeacherByUsername(id.getUtilizador());

				IMasterDegreeCandidate mdcTemp = new MasterDegreeCandidate();
				mdcTemp.setIdInternal(candidateID);

				IMasterDegreeCandidate masterDegreeCandidate =
					(IMasterDegreeCandidate) sp.getIPersistentMasterDegreeCandidate().readByOId(
						mdcTemp,
						false);

				if (masterDegreeCandidate == null) {
					return false;
				}

				if (!masterDegreeCandidate.getExecutionDegree().getCoordinator().equals(teacher)) {
					return false;
				}

				for (int i = 0; i < selection.length; i++) {
					ICurricularCourseScope ccScopeTemp = new CurricularCourseScope();
					ccScopeTemp.setIdInternal(selection[i]);
					ICurricularCourseScope curricularCourseScope =
						(ICurricularCourseScope) sp.getIPersistentCurricularCourse().readByOId(
							ccScopeTemp,
							false);
					if (!curricularCourseScope
						.getCurricularCourse()
						.getDegreeCurricularPlan()
						.equals(masterDegreeCandidate.getExecutionDegree().getCurricularPlan())) {
						return false;
					}
				}
				return true;

			} catch (Exception e) {
				return false;
			}
		}
		return true;
	}

	private List getRoleList(List roles) {
		List result = new ArrayList();
		Iterator iterator = roles.iterator();
		while (iterator.hasNext()) {
			result.add(((InfoRole) iterator.next()).getRoleType());
		}

		return result;
	}

}
