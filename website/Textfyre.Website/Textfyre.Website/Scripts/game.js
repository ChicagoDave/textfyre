function Game() {

    this.gameName = '';
    this.sessionKey = '';
    this.branchId = '';
    this.turn = '';

    this.promptChannel = '';
    this.mainChannel = '';
    this.timeChannel = '';
    this.locationChannel = '';
    this.chapterChannel = '';
    this.creditsChannel = '';
    this.hintsChannel = '';
    this.scoreChannel = '';
    this.titleChannel = '';
    this.prologueChannel = '';
    this.turnChannel = '';
    this.tipsChannel = '';
    this.versionChannel = '';
    this.verbChannel = '';

    this.setGame = function (gName) {
        this.gameName = gName;
        this.sessionKey = getCookie(this.gameName + 'SessionKey', '');
        this.branchId = getCookie(this.gameName + 'Branch', '');
        this.turn = getCookie(this.gameName + 'Turn', '1');
    }

    this.setSessionKey = function (key) {
        setCookie(this.gameName + 'SessionKey', key, 7);
        this.sessionKey = getCookie(this.gameName + 'SessionKey', '');
    }

    this.setBranchId = function (branch) {
        setCookie(this.gameName + 'Branch', branch, 7);
        this.branchId = getCookie(this.gameName + 'Branch', '');
    }

    this.setTurn = function (turn) {
        setCookie(this.gameName + 'Turn', turn, 7);
        this.turn = getCookie(this.gameName + 'Turn', '1');
    }

    this.loadChannelData = function (channelList) {
        this.promptChannel = this.getText(channelList, 'PRPT');
        this.mainChannel = this.getText(channelList, 'MAIN');
        this.timeChannel = this.getText(channelList, 'TIME');
        this.locationChannel = this.getText(channelList, 'LOCN');
        this.chapterChannel = this.getText(channelList, 'CHAP');
        this.creditsChannel = this.getText(channelList, 'CRED');
        this.hintsChannel = this.getText(channelList, 'HINT');
        this.scoreChannel = this.getText(channelList, 'SCOR');
        this.titleChannel = this.getText(channelList, 'TITL');
        this.prologueChannel = this.getText(channelList, 'PLOG');
        this.turnChannel = this.getText(channelList, 'TURN');
        this.tipsChannel = this.getText(channelList, 'TIPS');
        this.versionChannel = this.getText(channelList, 'VRSN');
        this.verbChannel = this.getText(channelList, 'VERB');
    }

    this.getText = function(channelList, channelName) {

        for (c = 0; c < channelList.length; c++) {

            if (channelList[c].Name == channelName)
                return channelList[c].Content;

        }

        return "";
    }

}