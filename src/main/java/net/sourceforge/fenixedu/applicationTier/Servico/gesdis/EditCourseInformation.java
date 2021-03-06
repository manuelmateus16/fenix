/*
 * Created on 12/Nov/2003
 *  
 */
package net.sourceforge.fenixedu.applicationTier.Servico.gesdis;

import net.sourceforge.fenixedu.applicationTier.Filtro.gesdis.EditCourseInformationAuthorizationFilter;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.NotAuthorizedException;
import net.sourceforge.fenixedu.dataTransferObject.gesdis.InfoCourseReport;
import net.sourceforge.fenixedu.domain.ExecutionCourse;
import net.sourceforge.fenixedu.domain.gesdis.CourseReport;
import pt.ist.fenixframework.Atomic;
import pt.ist.fenixframework.FenixFramework;

/**
 * @author jdnf and mrsp
 */
public class EditCourseInformation {

    protected void run(String courseReportID, InfoCourseReport infoCourseReport, String newReport) throws FenixServiceException {
        final CourseReport courseReport;
        if (courseReportID != null) {
            courseReport = FenixFramework.getDomainObject(courseReportID);
        } else {
            final ExecutionCourse executionCourse =
                    FenixFramework.getDomainObject(infoCourseReport.getInfoExecutionCourse().getExternalId());

            courseReport = executionCourse.createCourseReport(newReport);
        }

        if (courseReport == null) {
            throw new FenixServiceException();
        }

        courseReport.edit(newReport);
    }

    // Service Invokers migrated from Berserk

    private static final EditCourseInformation serviceInstance = new EditCourseInformation();

    @Atomic
    public static void runEditCourseInformation(String courseReportID, InfoCourseReport infoCourseReport, String newReport)
            throws FenixServiceException, NotAuthorizedException {
        EditCourseInformationAuthorizationFilter.instance.execute(courseReportID, infoCourseReport, newReport);
        serviceInstance.run(courseReportID, infoCourseReport, newReport);
    }

}