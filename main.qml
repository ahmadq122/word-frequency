import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Qt.labs.settings 1.0
import Maes.WordFrquency 1.0

ApplicationWindow {
    id: window
    visible: true
    //    visibility: "FullScreen"
    width: 1024
    height: 600
    title: qsTr("Word Frequency")


    //    Item{
    //        anchors.fill: parent
    /*    Loader{
        id: loaderComponent
        active: false
        sourceComponent:  */
    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.minimumHeight: 40
            Layout.fillWidth: true
            Row{
                Text {
                    height: 40
                    width: 60
                    text: "No"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: 40
                    width: 200
                    text: "Word"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: 40
                    width: 200
                    text: "Frequency"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Flickable {
            id: view
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: col.width
            contentHeight: col.height
            clip: true
            flickableDirection: Flickable.VerticalFlick
            Column{
                id: col
                Repeater{
                    model: WordFrquency.pWordFrequency
                    Row{
                        Text {
                            height: 40
                            width: 60
                            text: index
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            height: 40
                            width: 200
                            text: modelData[0]//props.wordFrequencyLists[index][0]
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            height: 40
                            width: 200
                            text: modelData[1]// props.wordFrequencyLists[index][1]
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }//

    Settings{
        id: settings

        property alias width: window.width
        property alias height: window.height
    }

    QtObject{
        id: props
        property int wordCount: WordFrquency.pWordCount
        property var wordFrequencyLists: WordFrquency.pWordFrequency

        function onWordCalculationDone(wordFrequencyList){
            //wordCount = WordFrquency.pWordCount;
            console.debug("wordCount", wordCount)
            console.debug(wordFrequencyList)
            wordFrequencyLists = wordFrequencyList
            console.debug("hahaha")
            console.debug(wordFrequencyLists[0][0], wordFrequencyLists[0][1])
            //            loaderComponent.active = true
        }
    }

    Component.onCompleted: {
        WordFrquency.sWordFrequencyChanged.connect(props.onWordCalculationDone)
        WordFrquency.performWordFrequency(":/example.txt");
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#808080";height:1000}
}
##^##*/
