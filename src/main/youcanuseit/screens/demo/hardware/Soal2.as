/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package main.youcanuseit.screens.demo.hardware {
import feathers.controls.Button;
import feathers.controls.ButtonGroup;
import feathers.controls.ImageLoader;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.data.ListCollection;
import feathers.layout.VerticalLayout;

import main.youcanuseit.data.EmbeddedAssets;
import main.youcanuseit.event.TestEvent;

import starling.events.Event;

public class Soal2 extends LayoutGroup {
    private var _questionLabel:Label;
    private var questionPic:ImageLoader;
    private var _buttonGroup:ButtonGroup;
    private var _result:ImageLoader;

    public function Soal2() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {

        var myLayout:VerticalLayout = new VerticalLayout();
        myLayout.gap = 5;
        myLayout.horizontalAlign = "center";
        this.layout = myLayout;

        this._questionLabel = new Label();
        this._questionLabel.styleNameList.add(Label.ALTERNATE_STYLE_NAME_HEADING);
        this._questionLabel.wordWrap = true;
        this._questionLabel.text = "This is an audio port. The green port is for ...";
        this.addChild(this._questionLabel);

        this.questionPic = new ImageLoader();
        this.questionPic.source = EmbeddedAssets.AUDIO_PORT;
        this.addChild(this.questionPic);

        this._buttonGroup = new ButtonGroup();
        this._buttonGroup.dataProvider = new ListCollection(
                [
                    {label: "Headphone", triggered: button_triggeredHandler},
                    {label: "Mic", triggered: button_triggeredHandler},
                    {label: "Mouse", triggered: button_triggeredHandler},
                    {label: "VGA", triggered: button_triggeredHandler},
                ]);
        this.addChild(this._buttonGroup);

        this._result = new ImageLoader();
        this.addChild(this._result);
    }

    private function button_triggeredHandler(event:Event):void {
        var button:Button = Button(event.currentTarget);
        trace(button.label + " triggered.");

        if (button.label == "Headphone") {
            this._buttonGroup.isEnabled = false;
            this._result.source = EmbeddedAssets.SUCCESS;
            this.dispatchEvent(new TestEvent(TestEvent.FINISHED, "soal2", true));
        } else {
            this._result.source = EmbeddedAssets.FALSE;
        }
    }
}
}
