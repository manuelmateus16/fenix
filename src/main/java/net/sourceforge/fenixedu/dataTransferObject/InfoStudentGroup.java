/*
 * Created on 22/Jul/2003
 *  
 */
package net.sourceforge.fenixedu.dataTransferObject;

import java.util.List;

import net.sourceforge.fenixedu.domain.StudentGroup;

/**
 * @author asnr and scpo
 * 
 */

public class InfoStudentGroup extends InfoObject {

    private Integer groupNumber;

    private InfoShift infoShift;

    private InfoGrouping infoGrouping;

    private List<InfoFrequenta> infoAttends;

    /**
     * Construtor
     */
    public InfoStudentGroup() {
    }

    /**
     * Construtor
     */
    public InfoStudentGroup(Integer groupNumber, InfoGrouping infoGrouping) {

        this.groupNumber = groupNumber;
        this.infoGrouping = infoGrouping;
    }

    /**
     * Construtor
     */
    public InfoStudentGroup(Integer groupNumber, InfoGrouping infoAttendsSet, InfoShift infoShift) {

        this.groupNumber = groupNumber;
        this.infoGrouping = infoAttendsSet;
        this.infoShift = infoShift;
    }

    /**
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object arg0) {
        boolean result = false;
        if (arg0 instanceof InfoStudentGroup) {
            result =
                    (getInfoGrouping().equals(((InfoStudentGroup) arg0).getInfoGrouping()))
                            && (getGroupNumber().equals(((InfoStudentGroup) arg0).getGroupNumber()));
            if (getInfoShift() != null) {
                result = result && (getInfoShift().equals(((InfoStudentGroup) arg0).getInfoShift()));
            } else if (((InfoStudentGroup) arg0).getInfoShift() != null) {
                result = false;
            }
        }
        return result;
    }

    /**
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        String result = "[INFO_STUDENT_GROUP";
        result += ", groupNumber=" + getGroupNumber();
        result += ", infoAttendsSet=" + getInfoGrouping();
        result += ", infoShift" + getInfoShift();
        result += "]";
        return result;
    }

    /**
     * @return Integer
     */
    public Integer getGroupNumber() {
        return groupNumber;
    }

    /**
     * @return InfoGroupProperties
     */
    public InfoGrouping getInfoGrouping() {
        return infoGrouping;
    }

    /**
     * @return InfoTurno
     */
    public InfoShift getInfoShift() {
        return infoShift;
    }

    /**
     * Sets the groupNumber.
     * 
     * @param groupNumber
     *            The groupNumber to set
     */
    public void setGroupNumber(Integer groupNumber) {
        this.groupNumber = groupNumber;
    }

    /**
     * Sets the infoGroupProperties.
     * 
     * @param infoGroupProperties
     *            The infoGroupProperties to set
     */
    public void setInfoGrouping(InfoGrouping infoGrouping) {
        this.infoGrouping = infoGrouping;
    }

    /**
     * Sets the infoShift.
     * 
     * @param infoShift
     *            The infoShift to set
     */
    public void setInfoShift(InfoShift infoShift) {
        this.infoShift = infoShift;
    }

    public void copyFromDomain(StudentGroup studentGroup) {
        super.copyFromDomain(studentGroup);

        if (studentGroup != null) {
            setGroupNumber(studentGroup.getGroupNumber());
        }
    }

    public static InfoStudentGroup newInfoFromDomain(StudentGroup studentGroup) {
        InfoStudentGroup infoStudentGroup = null;

        if (studentGroup != null) {
            infoStudentGroup = new InfoStudentGroup();
            infoStudentGroup.copyFromDomain(studentGroup);
        }

        return infoStudentGroup;
    }

    public List<InfoFrequenta> getInfoAttends() {
        return infoAttends;
    }

    public void setInfoAttends(List<InfoFrequenta> infoAttends) {
        this.infoAttends = infoAttends;
    }
}