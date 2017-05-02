import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQml 2.2

Entity {
    id: root
    objectName: "root"

    components: [
        RenderSettings {
            activeFrameGraph: SortedForwardRenderer {
                id: renderer
                camera: mainCamera
            }
        },
        InputSettings { }

    ]



    BasicCamera {
        id: mainCamera
        position: Qt.vector3d( 0.0, 3.5, 25.0 )
        viewCenter: Qt.vector3d( 0.0, 3.5, 0.0 )
    }

    FirstPersonCameraController { camera: mainCamera }

    PhongMaterial {
        id: redAdsMaterial
        ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
        diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )
    }

    PlaneEntity {
        id: floor

        width: 100
        height: 100
        resolution: Qt.size(20, 20)

        material: NormalDiffuseSpecularMapMaterial {
            ambient: Qt.rgba( 0.2, 0.2, 0.2, 1.0 )
            diffuse:  "qrc:/textures/diffuse.webp"
            specular: "qrc:/textures/specular.webp"
            normal:   "qrc:/textures/normal.webp"
            textureScale: 10.0
            shininess: 80.0
        }
    }

    TrefoilKnot {
        id: trefoilKnot
        material: redAdsMaterial
        y: 3.5
        scale: 0.5

        QQ2.ParallelAnimation {
            loops: QQ2.Animation.Infinite
            running: true

            QQ2.NumberAnimation {
                target: trefoilKnot
                property: "theta"
                from: 0; to: 360
                duration: 2000
            }

            QQ2.NumberAnimation {
                target: trefoilKnot
                property: "phi"
                from: 0; to: 360
                duration: 2000
            }
        }
    }

    Chest {
        id: chest1
        name: "chest1"
        x: -4
        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== chest1.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+"to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    chest1.x = value
                    break;
                case "valueY":
                    chest1.y = value
                    break;
                case "valueZ":
                    chest1.z = value
                    break;
                case "valueScale":
                    chest1.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant1
        name: "housePlant1"
        x: 4
        potShape: "square"
        plantType: "bamboo"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant1.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant1.x = value
                    break;
                case "valueY":
                    housePlant1.y = value
                    break;
                case "valueZ":
                    housePlant1.z = value
                    break;
                case "valueScale":
                    housePlant1.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant2
        name: "housePlant2"
        z: 4
        potShape: "triangle"
        plantType: "palm"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant2.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant2.x = value
                    break;
                case "valueY":
                    housePlant2.y = value
                    break;
                case "valueZ":
                    housePlant2.z = value
                    break;
                case "valueScale":
                    housePlant2.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant3
        name: "housePlant3"
        x: -4
        potShape: "sphere"
        plantType: "pine"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant3.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant3.x = value
                    break;
                case "valueY":
                    housePlant3.y = value
                    break;
                case "valueZ":
                    housePlant3.z = value
                    break;
                case "valueScale":
                    housePlant3.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant4
        name: "housePlant4"
        z: -4
        potShape: "cross"
        plantType: "spikes"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant4.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant4.x = value
                    break;
                case "valueY":
                    housePlant4.y = value
                    break;
                case "valueZ":
                    housePlant4.z = value
                    break;
                case "valueScale":
                    housePlant4.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant5
        name: "housePlant5"
        z: -8
        potShape: "cross"
        plantType: "palm"
        scale: 1.15

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant5.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant5.x = value
                    break;
                case "valueY":
                    housePlant5.y = value
                    break;
                case "valueZ":
                    housePlant5.z = value
                    break;
                case "valueScale":
                    housePlant5.scale = value
                    break;
                }
            }
        }
    }

    HousePlant {
        id: housePlant6
        name: "housePlant6"
        z: 8
        potShape: "cross"
        plantType: "shrub"
        scale: 1.15

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== housePlant6.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    housePlant6.x = value
                    break;
                case "valueY":
                    housePlant6.y = value
                    break;
                case "valueZ":
                    housePlant6.z = value
                    break;
                case "valueScale":
                    housePlant6.scale = value
                    break;
                }
            }
        }
    }

    Barrel {
        id: barrel1
        name: "barrel1"
        x: 8

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== barrel1.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    barrel1.x = value
                    break;
                case "valueY":
                    barrel1.y = value
                    break;
                case "valueZ":
                    barrel1.z = value
                    break;
                case "valueScale":
                    barrel1.scale = value
                    break;
                }
            }
        }
    }

    Barrel {
        id: barrel2
        name: "barrel2"
        x: 10
        diffuseColor: "rust"
        bump: "hard_bumps"
        specular: "rust"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== barrel2.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    barrel2.x = value
                    break;
                case "valueY":
                    barrel2.y = value
                    break;
                case "valueZ":
                    barrel2.z = value
                    break;
                case "valueScale":
                    barrel2.scale = value
                    break;
                }
            }
        }
    }

    Barrel {
        id: barrel3
        name: "barrel3"
        x: 12
        diffuseColor: "blue"
        bump: "middle_bumps"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== barrel3.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    barrel3.x = value
                    break;
                case "valueY":
                    barrel3.y = value
                    break;
                case "valueZ":
                    barrel3.z = value
                    break;
                case "valueScale":
                    barrel3.scale = value
                    break;
                }
            }
        }
    }

    Barrel {
        id: barrel4
        name: "barrel4"
        x: 14
        diffuseColor: "green"
        bump: "soft_bumps"

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== barrel4.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    barrel4.x = value
                    break;
                case "valueY":
                    barrel4.y = value
                    break;
                case "valueZ":
                    barrel4.z = value
                    break;
                case "valueScale":
                    barrel4.scale = value
                    break;
                }
            }
        }
    }

    Barrel {
        id: barrel5
        name: "barrel5"
        x: 16
        diffuseColor: "stainless_steel"
        bump: "no_bumps"
        specular: "stainless_steel"
        shininess: 150

        onMouseClicked: {
            var json = {
                name: name,
                valueX: x,
                valueY: y,
                valueZ: z,
                valueScale: scale
            }
            _entityBinding.setCurrentEntity(name)
            _entityBinding.setCurrentProperty(json)
            _entityBinding.setRunningInfo("User clicked module: "+ name)
        }

        Connections {
            target: _entityBinding
            onCurrentValueChanged: {
                if(_entityBinding.getCurrentEntity() !== barrel5.name)
                    return

                 _entityBinding.setRunningInfo("User changed: "+_entityBinding.getCurrentValueId()+" to " + value)

                switch(_entityBinding.getCurrentValueId()){
                case "valueX":
                    barrel5.x = value
                    break;
                case "valueY":
                    barrel5.y = value
                    break;
                case "valueZ":
                    barrel5.z = value
                    break;
                case "valueScale":
                    barrel5.scale = value
                    break;
                }
            }
        }
    }
}
