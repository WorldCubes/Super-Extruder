require 'sketchup.rb'
require 'extensions.rb'

module Example
  module PushPullTool

    def self.activate_pushpull_tool
      model = Sketchup.active_model
      selection = model.selection

      # Define the pushpull distance
      distance = @value || 1.m

      # Do the pushpull operation on each selected face
      selection.grep(Sketchup::Face).each do |face|
        face.pushpull(distance)
      end
    end

  #  unless file_loaded?(__FILE__)
      # Create a new WebDialog instance
      dialog = UI::HtmlDialog.new({
  :dialog_title => "      S u p e r    E x t r u d e    ",
  :preferences_key => "com.MoveTool.htmlDialog",
  :scrollable => false,
  :resizable => false,
  :width => 240,
  :height => 200,
  :left => 250,
  :top => 430,
  :min_width => 50,
  :min_height => 160,
  :max_width =>1000,
  :max_height => 190,
  :style => UI::HtmlDialog::STYLE_DIALOG
})

  # HTML for the dialog
html = <<~HTML
<html>
 <head>
    <style>
     @font-face {
        font-family: "Microgramma";
       src: url("C:/SUI/Eurostile Bold Extended.ttf");
      }
       body {
        font-family: "Microgramma";
         src: url("C:/SUI/Eurostile Bold Extended.ttf");

        // background-color: rgb(211, 241, 148);
        background: linear-gradient(
          0deg,
          rgba(120, 150, 150, 1) 0%,
          rgba(183, 209, 209, 1) 3%,
          rgba(210, 240, 240, 1) 96%,
           rgba(243, 243, 243, 1) 100%
        );
         color: rgba(0, 0, 0, 0.8);
        padding: 0px;
        font-size: 10px;
        text-shadow: 0 0px 2px  rgba(255, 255, 255, 0.6);
       //  box-shadow: inset  0 0px 8px -4px rgba(255, 255, 255, 0.6);
         line-height: 0;
      }
      #multiplier_label
      {
         color: rgba(0, 0, 0, 0.5);
      }
       input {
       font-family: "Microgramma", Arial, Lucida Grande, sans-serif;
        font-size: 12.5px;
        text-align: right;
        line-height: 1.2;
        color: #333333;
        background: rgba(255,255,255,0.8);
        padding-right: 4px;
        border-radius: 4px;
        outline: none;
      }
      button {
      font-family: "Microgramma", Arial, Lucida Grande, sans-serif;
      width: 60px;
      font-size: 11px;
      margin: 1px;
       color: rgba(0, 0, 0, 0.8);
      }
      #dist {
         width: 172px;
           width: 112px;
      }
     //   #multiplier {
     //    width: 80px;
    //  }
       #multiplierText {
         width: 34px;
         color: rgba(0, 0, 0, 0.6);
      }
      #totalLabel{
        color: rgba(0, 0, 0, 0.6);
      }

      #totalDistance {

         color: rgba(0, 0, 0, 0.6);
      }
        #offsetText,#totalDistance
      {
        width: 52px;
      }
      .slider2 {
         width: 62px;
      }
         </style>
  </head>
  <body>
    <label for="distance">Distance:</label>
    <input type="range" id="distance" class="slider" name="distance" min="-256" max="256" step="4" oninput="updateValue();">

    <input type="text" id="pushtext" value="0" size="2" />
    <button onclick="window.location='skp:pushpull@' + document.getElementById('distance').value">Extrude</button>
    <br>
  <label for="dist">Dist:</label>
      <input type="range" min="0" max="12" value="5" class="slider" id="Multiplier" name="offset" step="1" oninput="updateTextInput(values[this.value]);" list="lengthsettings" >
    <datalist id="lengthsettings">
  <option>0</option>
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  <option>6</option>
  <option>7</option>
  <option>8</option>
  <option>9</option>
  <option>10</option>
   <option>11</option>
   <option>12</option>
</datalist>
  <input type="text" id="offsetText" value="8" size="4" /><br />

    <script>
       var values = [0.25, 0.5, 1, 2, 4, 8, 16, 32, 64, 128 ,256 ,512, 1024];

       function updateTextInput(val) {

        document.getElementById("offsetText").value = parseFloat(val);
      }

    function updateValue() {
    var slider = document.getElementById('distance');
    document.getElementById('pushtext').value = parseFloat(slider.value);
}


    </script>
  </body>
</html>

HTML




      # Set the dialog's HTML
      dialog.set_html(html)

  # Add an action callback
dialog.add_action_callback("pushpull") do |dialog, params|
  @value = params.to_f.m
  self.activate_pushpull_tool
end

      # Show the dialog
      dialog.show

    #  file_loaded(__FILE__)
 #   end

  end
end
