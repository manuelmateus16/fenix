package net.sourceforge.fenixedu.util;

public class StudentCurricularPlanIDDomainType extends FenixUtil {
    public static final String ALL_TYPE = "-1";

    public static final String NEWEST_TYPE = "-2";

    public static final String ALL_STRING = "Todos os planos curriculares";

    public static final String NEWEST_STRING = "Plano curricular mais recente";

    public static final StudentCurricularPlanIDDomainType ALL = new StudentCurricularPlanIDDomainType(
            StudentCurricularPlanIDDomainType.ALL_TYPE);

    public static final StudentCurricularPlanIDDomainType NEWEST = new StudentCurricularPlanIDDomainType(
            StudentCurricularPlanIDDomainType.NEWEST_TYPE);

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String idType) {
        id = idType;
    }

    public StudentCurricularPlanIDDomainType(String idType) {
        super();
        setId(idType);
    }

    @Override
    public String toString() {
        return "" + getId();
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof StudentCurricularPlanIDDomainType) {
            StudentCurricularPlanIDDomainType sc = (StudentCurricularPlanIDDomainType) o;
            if (getId().equals(sc.getId())) {
                return true;
            }
        }
        return false;
    }

    public boolean isAll() {
        return (this.equals(StudentCurricularPlanIDDomainType.ALL));
    }

    public boolean isNewest() {
        return (this.equals(StudentCurricularPlanIDDomainType.NEWEST));
    }
}
