package net.sourceforge.fenixedu.dataTransferObject.precedences;

import net.sourceforge.fenixedu.domain.precedences.RestrictionByCurricularCourse;

/**
 * @author David Santos on Jul 27, 2004
 */

public class InfoRestrictionDoneOrHasEverBeenEnrolledInCurricularCourse extends InfoRestrictionDoneCurricularCourse {

    public InfoRestrictionDoneOrHasEverBeenEnrolledInCurricularCourse() {
    }

    @Override
    public void copyFromDomain(RestrictionByCurricularCourse restriction) {
        super.copyFromDomain(restriction);
        super.setRestrictionKindResourceKey("label.manager.restrictionDoneOrHasEverBeenEnrolledInCurricularCourse");
    }

    public static InfoRestrictionByCurricularCourse newInfoFromDomain(RestrictionByCurricularCourse restriction) {

        InfoRestrictionDoneOrHasEverBeenEnrolledInCurricularCourse infoRestriction = null;

        if (restriction != null) {
            infoRestriction = new InfoRestrictionDoneOrHasEverBeenEnrolledInCurricularCourse();
            infoRestriction.copyFromDomain(restriction);
        }

        return infoRestriction;
    }

}