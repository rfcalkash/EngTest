import QtQuick.Controls.Material
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ApplicationWindow {
    width: 640
    height: 900
    visible: true

    function ensureString(value) {
        if (typeof value !== 'string') {
            return String(value);
        }
        return value;
    }
    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.fillWidth: true
            height: Material.delegateHeight
            RoundButton{
                text: "<"
                visible: stackView.depth>1
                onClicked: {
                    confirmQuitDialog.open()
                }

            }
            Label{
                id: testName
                anchors.centerIn: parent
                text:"Главное меню"
            }
        }

        StackView{
            id: stackView
            Layout.fillHeight: true
            Layout.fillWidth: true
            initialItem: mainMenuComponent
        }
    }

    MessageDialog{
        id: confirmQuitDialog
        buttons: MessageDialog.Ok|MessageDialog.Cancel
        title: "Выход"
        informativeText: "Выйти из теста?"
        detailedText: "Прогресс будет утерян."
        onAccepted:{
            stackView.pop()
            testName.text="Главное меню"
        }
    }

    Component{
        id:mainMenuComponent
        Page{
            ColumnLayout{
                width: parent.width/2
                height: implicitHeight
                anchors.centerIn: parent
                Button{
                    Layout.fillWidth: true
                    text:"English"
                    onClicked: {
                        testName.text="English"
                        stackView.push("qrc:/EngPage.qml")
                    }
                }
                Button{
                    Layout.fillWidth: true
                    text:"Окружающий мир"
                    onClicked: {
                        testName.text="Окружающий мир"
                        stackView.push("qrc:/WorldPage.qml")
                    }
                }
                Button{
                    Layout.fillWidth: true
                    text:"Окружающий мир (экспресс-тест)"
                    onClicked: {
                        testName.text="Окружающий мир"
                        stackView.push("qrc:/WorldPage_express.qml")
                    }
                }
                Button{
                    Layout.fillWidth: true
                    text:"Математика"
                    onClicked: {
                        testName.text="Математика"
                        stackView.push("qrc:/MathPage.qml")
                    }
                }
            }
        }
    }
}
