package net.sourceforge.fenixedu.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;

import net.sourceforge.fenixedu.domain.candidacy.degree.ShiftDistribution;
import net.sourceforge.fenixedu.domain.degree.DegreeType;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.time.calendarStructure.AcademicInterval;
import net.sourceforge.fenixedu.domain.time.calendarStructure.AcademicYearCE;
import net.sourceforge.fenixedu.util.PeriodState;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.joda.time.DateMidnight;
import org.joda.time.DateTime;
import org.joda.time.Interval;
import org.joda.time.YearMonthDay;

import dml.runtime.RelationAdapter;

/**
 * Created on 11/Fev/2003
 * 
 * @author Jo�o Mota ciapl Dominio
 * 
 */
public class ExecutionYear extends ExecutionYear_Base implements Comparable<ExecutionYear> {

    static {
	ExecutionPeriodExecutionYear.addListener(new ExecutionPeriodExecutionYearListener());
    }

    static final public Comparator<ExecutionYear> COMPARATOR_BY_YEAR = new Comparator<ExecutionYear>() {
	public int compare(ExecutionYear o1, ExecutionYear o2) {
	    return o1.getYear().compareTo(o2.getYear());
	}
    };

    static final public Comparator<ExecutionYear> REVERSE_COMPARATOR_BY_YEAR = new Comparator<ExecutionYear>() {
	public int compare(ExecutionYear o1, ExecutionYear o2) {
	    return -COMPARATOR_BY_YEAR.compare(o1, o2);
	}
    };

    private ExecutionYear() {
	super();
	setRootDomainObject(RootDomainObject.getInstance());
    }

    public ExecutionYear(AcademicInterval academicInterval) {
	this();
	setExecutionInterval(academicInterval);
    }

    @Override
    public void setExecutionInterval(AcademicInterval executionInterval) {
	if(executionInterval == null) {
	    throw new DomainException("error.ExecutionYear.empty.executionInterval");
	}
	super.setExecutionInterval(executionInterval);
    }

    public YearMonthDay getBeginDateYearMonthDay() {
	return getExecutionInterval().getBeginYearMonthDayWithoutChronology();
    }

    public YearMonthDay getEndDateYearMonthDay() {
	return getExecutionInterval().getEndYearMonthDayWithoutChronology();
    }

    public Collection<ExecutionDegree> getExecutionDegreesByType(final DegreeType degreeType) {
	return CollectionUtils.select(getExecutionDegrees(), new Predicate() {
	    public boolean evaluate(Object arg0) {
		ExecutionDegree executionDegree = (ExecutionDegree) arg0;
		return executionDegree.getDegreeCurricularPlan().getDegreeType() == degreeType;
	    }
	});
    }

    public ExecutionYear getNextExecutionYear() {	
	AcademicYearCE year = getExecutionInterval().plusYear(1);
	return getExecutionYear(year);
    }

    public ExecutionYear getPreviousExecutionYear() {
	AcademicYearCE year = getExecutionInterval().minusYear(1);
	return getExecutionYear(year);
    }    

    public ExecutionYear getPreviousExecutionYear(final Integer previousCivilYears) {	
	if(previousCivilYears >= 0) {
	    AcademicYearCE year = getExecutionInterval().minusYear(previousCivilYears);
	    return getExecutionYear(year);
	}	
	return null;
    }

    public boolean hasPreviousExecutionYear() {
	return getPreviousExecutionYear() != null;
    }

    public boolean hasNextExecutionYear() {
	return getNextExecutionYear() != null;
    }

    public int compareTo(ExecutionYear object) {
	if(object == null) {
	    return 1;
	}
	return getExecutionInterval().getStartDateTimeWithoutChronology().compareTo(object.getExecutionInterval().getStartDateTimeWithoutChronology());
    }

    public boolean isAfter(final ExecutionYear executionYear) {
	return this.compareTo(executionYear) > 0;
    }

    public boolean isAfterOrEquals(final ExecutionYear executionYear) {
	return this.compareTo(executionYear) >= 0;
    }

    public boolean isBefore(final ExecutionYear executionYear) {
	return this.compareTo(executionYear) < 0;
    }

    public boolean isBeforeOrEquals(final ExecutionYear executionYear) {
	return this.compareTo(executionYear) <= 0;
    }

    public Collection<ExecutionDegree> getExecutionDegreesSortedByDegreeName() {
	final List<ExecutionDegree> executionDegrees = new ArrayList<ExecutionDegree>(
		getExecutionDegrees());
	Collections.sort(executionDegrees,
		ExecutionDegree.EXECUTION_DEGREE_COMPARATORY_BY_DEGREE_TYPE_AND_NAME);
	return executionDegrees;
    }

    public ExecutionPeriod readExecutionPeriodForSemester(final Integer semester) {
	for (final ExecutionPeriod executionPeriod : getExecutionPeriods()) {
	    if (executionPeriod.isFor(semester)) {
		return executionPeriod;
	    }
	}
	return null;
    }

    public ExecutionPeriod getFirstExecutionPeriod() {
	return (ExecutionPeriod) Collections.min(this.getExecutionPeriods(),
		ExecutionPeriod.EXECUTION_PERIOD_COMPARATOR_BY_SEMESTER_AND_YEAR);
    }

    public ExecutionPeriod getLastExecutionPeriod() {
	return (ExecutionPeriod) Collections.max(this.getExecutionPeriods(),
		ExecutionPeriod.EXECUTION_PERIOD_COMPARATOR_BY_SEMESTER_AND_YEAR);
    }

    public List<ExecutionPeriod> readNotClosedPublicExecutionPeriods() {
	final List<ExecutionPeriod> result = new ArrayList<ExecutionPeriod>();
	for (final ExecutionPeriod executionPeriod : getExecutionPeriodsSet()) {
	    if (!executionPeriod.isClosed() && !executionPeriod.isNotOpen()) {
		result.add(executionPeriod);
	    }
	}
	return result;
    }

    public ExecutionPeriod readExecutionPeriodByName(final String name) {
	for (final ExecutionPeriod executionPeriod : getExecutionPeriodsSet()) {
	    if (executionPeriod.getName().equals(name)) {
		return executionPeriod;
	    }
	}
	return null;
    }

    public String getNextYearsYearString() {
	final int yearPart1 = Integer.parseInt(getYear().substring(0, 4)) + 1;
	final int yearPart2 = Integer.parseInt(getYear().substring(5, 9)) + 1;
	return Integer.toString(yearPart1) + getYear().charAt(4) + Integer.toString(yearPart2);
    }

    public DegreeInfo getDegreeInfo(final Degree degree) {
	for (final DegreeInfo degreeInfo : getDegreeInfos()) {
	    if (degreeInfo.getDegree().equals(degree)) {
		return degreeInfo;
	    }
	}
	return null;
    }

    public boolean containsDate(final DateTime dateTime) {
	final DateMidnight begin = getBeginDateYearMonthDay().toDateMidnight();
	final DateMidnight end = getEndDateYearMonthDay().plusDays(1).toDateMidnight();
	return new Interval(begin, end).contains(dateTime);
    }

    public List<ExecutionDegree> getExecutionDegreesFor(final DegreeType... degreeTypes) {
	final List<ExecutionDegree> result = new ArrayList<ExecutionDegree>();
	final List<DegreeType> degreeTypesList = Arrays.asList(degreeTypes);
	for (final ExecutionDegree executionDegree : getExecutionDegreesSet()) {
	    if (degreeTypesList.contains(executionDegree.getDegreeCurricularPlan().getDegree()
		    .getDegreeType())) {
		result.add(executionDegree);
	    }
	}
	return result;
    }

    public boolean isCurrent() {
	return this.getState().equals(PeriodState.CURRENT);
    }

    public boolean isOpen() {
	return getState().equals(PeriodState.OPEN);
    }

    public boolean isClosed() {
	return getState().equals(PeriodState.CLOSED);
    }

    public boolean isFor(final String year) {
	return getYear().equals(year);
    }

    public ShiftDistribution createShiftDistribution() {
	return new ShiftDistribution(this);
    }

    public void delete() {
	if (!getExecutionDegreesSet().isEmpty()) {
	    throw new Error("cannot.delete.execution.year.because.execution.degrees.exist");
	}
	for (; hasAnyExecutionPeriods(); getExecutionPeriodsSet().iterator().next().delete());

	removeRootDomainObject();
	deleteDomainObject();
    }

    public boolean belongsToCivilYear(int civilYear) {
	return (getBeginDateYearMonthDay().getYear() == civilYear || getEndDateYearMonthDay().getYear() == civilYear);
    }

    public boolean belongsToCivilYearInterval(int beginCivilYear, int endCivilYear) {
	for (int year = beginCivilYear; year <= endCivilYear; year++) {
	    if (belongsToCivilYear(year)) {
		return true;
	    }
	}
	return false;
    }

    public boolean isBeforeCivilYear(int civilYear) {
	return getEndDateYearMonthDay().getYear() < civilYear;
    }

    public boolean isAfterCivilYear(int civilYear) {
	return getBeginDateYearMonthDay().getYear() > civilYear;
    }

    public Collection<DegreeCurricularPlan> getDegreeCurricularPlans() {
	final Collection<DegreeCurricularPlan> result = new HashSet<DegreeCurricularPlan>();
	for (final ExecutionDegree executionDegree : getExecutionDegreesSet()) {
	    result.add(executionDegree.getDegreeCurricularPlan());
	}
	return result;
    }

    private static class ExecutionPeriodExecutionYearListener extends RelationAdapter<ExecutionYear, ExecutionPeriod> {
	@Override
	public void beforeAdd(ExecutionYear executionYear, ExecutionPeriod executionPeriod) {
	    if(executionYear != null && executionPeriod != null && executionYear.getExecutionPeriodsCount() == 2) {
		throw new DomainException("error.ExecutionYear.exceeded.number.of.executionPeriods", executionYear.getYear());
	    }	    
	}
    }

    // -------------------------------------------------------------
    // read static methods
    // -------------------------------------------------------------

    public static ExecutionYear getExecutionYear(AcademicYearCE entry) {
	if(entry != null) {
	    for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
		if(executionYear.getExecutionInterval().getAcademicCalendarEntry().equals(entry)) {
		    return executionYear;
		}
	    }
	}
	return null;
    }  

    static public ExecutionYear readCurrentExecutionYear() {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.isCurrent()) {
		return executionYear;
	    }
	}
	return null;
    }

    static public List<ExecutionYear> readOpenExecutionYears() {
	final List<ExecutionYear> result = new ArrayList<ExecutionYear>();
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.isOpen()) {
		result.add(executionYear);
	    }
	}
	return result;
    }

    static public List<ExecutionYear> readNotClosedExecutionYears() {
	final List<ExecutionYear> result = new ArrayList<ExecutionYear>();
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (!executionYear.isClosed()) {
		result.add(executionYear);
	    }
	}
	return result;
    }

    static public ExecutionYear readExecutionYearByName(final String year) {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.isFor(year)) {
		return executionYear;
	    }
	}
	return null;
    }

    static public ExecutionYear readFirstBolonhaExecutionYear() {
	// TODO: have the patience and time to parameterize this in
	// build.properties
	return ExecutionYear.readExecutionYearByName("2006/2007");
    }

    static public ExecutionYear readByDateTime(final DateTime dateTime) {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.containsDate(dateTime)) {
		return executionYear;
	    }
	}
	return null;
    }

    public static ExecutionYear readBy(final YearMonthDay begin, YearMonthDay end) {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.getBeginDateYearMonthDay().isEqual(begin) 
		    && executionYear.getEndDateYearMonthDay().isEqual(end)) {
		return executionYear;
	    }
	}
	return null;
    }

    static public ExecutionYear getExecutionYearByDate(final YearMonthDay date) {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYearsSet()) {
	    if (executionYear.containsDate(date.toDateTimeAtMidnight())) {
		return executionYear;
	    }
	}
	return null;
    }

    static public List<ExecutionYear> readExecutionYearsByCivilYear(int civilYear) {
	final List<ExecutionYear> result = new ArrayList<ExecutionYear>();
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYears()) {
	    if (executionYear.belongsToCivilYear(civilYear)) {
		result.add(executionYear);
	    }
	}

	return result;

    }

    static public ExecutionYear readFirstExecutionYear() {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYears()) {
	    if (!executionYear.hasPreviousExecutionYear()) {
		return executionYear;
	    }
	}
	return null;
    }

    static public ExecutionYear readLastExecutionYear() {
	for (final ExecutionYear executionYear : RootDomainObject.getInstance().getExecutionYears()) {
	    if (!executionYear.hasNextExecutionYear()) {
		return executionYear;
	    }
	}
	return null;
    }

    @Deprecated   
    public java.util.Date getBeginDate(){  
	YearMonthDay day = getBeginDateYearMonthDay(); 
	return (day == null) ? null : new java.util.Date(day.getYear() - 1900, day.getMonthOfYear() - 1, day.getDayOfMonth());   
    }

    @Deprecated   
    public java.util.Date getEndDate(){  
	YearMonthDay day = getEndDateYearMonthDay(); 
	return (day == null) ? null : new java.util.Date(day.getYear() - 1900, day.getMonthOfYear() - 1, day.getDayOfMonth());   
    }
}
