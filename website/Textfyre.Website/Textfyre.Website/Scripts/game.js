function Game() {

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
    this.tutorialChannel = '';
    this.mapsChannel = '';

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
        this.tutorialChannel = this.getText(channelList, 'TUTR');
        this.mapsChannel = this.getText(channelList, 'MAPS');
    }

    this.getText = function(channelList, channelName) {

        for (c = 0; c < channelList.length; c++) {

            if (channelList[c].Name == channelName)
                return channelList[c].Content;

        }

        return "";
    }

}