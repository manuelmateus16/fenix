package net.sourceforge.fenixedu.presentationTier.Action.publico.pedagogicalCouncil;

import javax.servlet.http.HttpServletRequest;

import net.sourceforge.fenixedu.presentationTier.Action.publico.UnitSiteBoardsDA;

public class PedagogicalCouncilAnnouncementsDA extends UnitSiteBoardsDA {

    @Override
    protected String getBoardName(HttpServletRequest request) {
        return UnitSiteBoardsDA.ANNOUNCEMENTS;
    }

	@Override
	protected String getActionPath(HttpServletRequest request) {
		return "/pedagogicalCouncil/announcements.do";
	}

}
