/*
 * Created on Dec 18, 2003 by jpvl
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Servico.teacher.professorship;

import static net.sourceforge.fenixedu.injectionCode.AccessControl.check;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.Professorship;
import net.sourceforge.fenixedu.domain.Teacher;
import net.sourceforge.fenixedu.predicates.RolePredicates;
import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.FenixFramework;

/**
 * @author jpvl
 */
public class UpdateProfessorshipsHours {

    @Atomic
    public static Boolean run(String teacherId, String executionYearId, final HashMap hours) throws FenixServiceException {
        check(RolePredicates.CREDITS_MANAGER_PREDICATE);

        Iterator entries = hours.entrySet().iterator();
        while (entries.hasNext()) {
            Map.Entry entry = (Entry) entries.next();

            String key = entry.getKey().toString();
            String value = (String) entry.getValue();
            if (value != null) {
                try {
                    Double ecHours = Double.valueOf(value);
                    Teacher teacher = FenixFramework.getDomainObject(teacherId);
                    ExecutionCourse executionCourse = FenixFramework.getDomainObject(key);
                    Professorship professorship = teacher.getProfessorshipByExecutionCourse(executionCourse);
                    professorship.setHours(ecHours);
                } catch (NumberFormatException e1) {
                    // ignored
                }
            }
        }
        return Boolean.TRUE;
    }
}