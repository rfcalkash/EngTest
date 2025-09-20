import QtQuick.Controls.Material
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Page {
    id: rootPage
    title: qsTr("English tester")
    header: Label{
        id: headerTitle
        width: rootPage.width
        height: implicitHeight
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Material.dialogTitleFontPixelSize
    }

    property int questionsLeft: questionsOrder.length
    property int corrects: 0
    property int inCorrects: 0
    property alias currentAnswer: answerInput.text
    property alias headerTitleText: headerTitle.text
    property alias showInput: answerInput.visible
    property alias inputHint: answerInput.inputMethodHints

    function setLoader(src, properties){
        loader.setSource(src,properties)
    }

    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
    }

    Component.onCompleted: {
        init()
        nextQuestion()
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 20
        RowLayout{
            Layout.fillWidth: true
            Label{
                text: "Осталось: "+questionsLeft+"\nВерных: "+corrects+"\nОшибок: "+inCorrects
                Layout.fillWidth: true
                wrapMode: Text.Wrap
            }
            Button{
                Layout.alignment: Qt.AlignVCenter
                text: "Сброс"
                onClicked: confirmResetDialog.open()
            }
        }

        Loader{
            id: loader
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        RowLayout{
            Layout.fillWidth: true
            TextField{
                id: answerInput
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                placeholderText: "Ответ"
                enabled: loader.status===Loader.Ready && !loader.item.checked
            }
            Button{
                Layout.alignment: Qt.AlignVCenter
                text:loader.status===Loader.Ready?(loader.item.checked?"Дальше":"Проверить"):"Гружу"
                enabled: loader.status===Loader.Ready && (loader.item.checked || loader.item.canCheck)
                onClicked: {
                    if(!loader.item.checked){
                        var isCorrect=loader.item.check()
                        loader.item.correct=isCorrect
                        if(isCorrect) {corrects++}else{inCorrects++}
                        loader.item.checked=true
                    }
                    else{
                        nextQuestion()
                        answerInput.text=""
                    }
                }
            }
        }
    }
    MessageDialog{
        id: confirmResetDialog
        buttons: MessageDialog.Ok|MessageDialog.Cancel
        title: "Сброс"
        informativeText: "Сбросить прогресс?"
        detailedText: "Статистика ответов сбросится и испытание начнется заново."
        onAccepted:{
            init()
            nextQuestion()
        }
    }
}
