import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Controls 1.0
import Machinekit.Service 1.0

ColumnLayout {
    id: root
    property string labelName: "Gantry Configuration"
    visible: halRemoteComponent.ready && !halRemoteComponent.error

    Service {
        id: halrcompService
        type: "halrcomp"
    }

    Service {
        id: halrcmdService
        type: "halrcmd"
    }

    HalRemoteComponent {
        id: halRemoteComponent
        halrcmdUri: halrcmdService.uri
        halrcompUri: halrcompService.uri
        ready: (halrcmdService.ready && halrcompService.ready) || connected
        name: "gantry-config"
        containerItem: container
        create: false
        onErrorStringChanged: console.log(errorString)
    }

    ColumnLayout {
        id: container
        enabled:  halRemoteComponent.connected
        Layout.fillWidth: true

        Label {
            font.bold: true
            text: root.labelName
        }
        GridLayout {
            columns: 2

            Label {
                text: qsTr("Left offset:")
            }

            HalSpinBox {
                name: "offset-left"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }

            Label {
                text: qsTr("Right offset:")
            }

            HalSpinBox {
                name: "offset-right"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }

            Label {
                text: qsTr("Z Left back offset:")
            }

            HalSpinBox {
                name: "offset-left-back"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }

            Label {
                text: qsTr("Z Right back offset:")
            }

            HalSpinBox {
                name: "offset-right-back"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }

            Label {
                text: qsTr("Z Left front offset:")
            }

            HalSpinBox {
                name: "offset-left-front"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }

            Label {
                text: qsTr("Z Right front offset:")
            }

            HalSpinBox {
                name: "offset-right-front"
                suffix: "mm"
                minimumValue: 0.0
                maximumValue: 999.9
                decimals: 3
                stepSize: 0.05
                halPin.direction: HalPin.IO
            }
        }
    }
}

