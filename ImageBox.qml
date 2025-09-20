import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return currentAnswer.trim().toLowerCase()===(question.item.word+" "+question.prep.word).toLowerCase()
    }
    property bool canCheck: currentAnswer.trim().length>0
    
    property var question
    property bool checked: false
    property bool correct: false
    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: boxId
                width: Math.min(parent.height,parent.width)/2
                height: width
                source:"qrc:/images/box_front.png"
                z:question.prep.boxFZ
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: question.prep.boxHAlignment===Qt.AlignHCenter?parent.horizontalCenter:undefined
            }
            Image {
                anchors.fill: boxId
                source:"qrc:/images/box_back.png"
                z:question.prep.boxBZ
            }
            Image {
                width: Math.min(parent.height,parent.width)/3
                height: width
                source: question.item.image
                z:question.prep.itemZ
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: question.prep.itemVOffset*height
                anchors.horizontalCenter: question.prep.itemHAlignment===Qt.AlignHCenter?parent.horizontalCenter:undefined
                anchors.right: question.prep.itemHAlignment===Qt.AlignRight?parent.right:undefined
            }

        }
        Label{
            Layout.fillWidth: true
            textFormat: Text.StyledText
            text: !checked?"The ... ... the box":("The "+"<font color=\""+(correct?"green":"red")+"\">"+question.item.word+" "+question.prep.word+"</font>"+" the box")
        }
    }
}
