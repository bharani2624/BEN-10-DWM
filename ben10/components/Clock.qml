/*
    SPDX-FileCopyrightText: 2016 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.15
import QtQuick.Layouts 1.15

import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core 2.0 as PlasmaCore

ColumnLayout {
    readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software

    PlasmaComponents3.Label
    {
        text:"BEN-10"
        font.pointSize:50
        font.family:"GROBOLD"
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? PlasmaCore.ColorScope.backgroundColor : "#FFFFFF" 
        color:"#328336"
        // backgroundColor:"black"
    }
    PlasmaComponents3.Label {
        text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? PlasmaCore.ColorScope.backgroundColor : "#FFFFFF" 
        font.family:"GROBOLD"
        // styleColor: "#FF5733" 
        color:"#328336"
        font.pointSize: 30
        // text.color:"#FF5733" 
        Layout.alignment: Qt.AlignHCenter
    }
    // PlasmaComponents3.Label {
    //     text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
    //     style: softwareRendering ? Text.Outline : Text.Normal
    //     styleColor: softwareRendering ? PlasmaCore.ColorScope.backgroundColor : "blue" 
    //     font.pointSize: 15
    //     Layout.alignment: Qt.AlignHCenter
    // }
    PlasmaCore.DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }
}
