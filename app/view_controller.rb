class ViewController < UIViewController
  stylesheet :stylesheet

  VIBE = NSMutableDictionary.dictionary.tap do |dict|
           arr = NSMutableArray.array
           arr.addObject NSNumber.numberWithBool(true)
           arr.addObject NSNumber.numberWithInt(1)
           dict.setObject arr, forKey: "VibePattern"
           dict.setObject NSNumber.numberWithInt(1), forKey: "Intensity"
         end

  def viewDidLoad
    layout(self.view, :root) do
      @logo = subview(UIView, :logo)
      @label = subview(UILabel, :label)
      @slider = subview(UISlider, :slider)

      auto do
        metrics 'margin' => 20
        vertical "|-[logo]-margin-[label]-margin-[slider]-|"
        horizontal "|-margin-[logo]-margin-|"
        horizontal "|-margin-[label]-margin-|"
        horizontal "|-margin-[slider]-margin-|"
      end

      @slider.addTarget self, action: 'updater', forControlEvents: UIControlEventValueChanged
      @slider.define_singleton_method('frequency') { self.value * 60 }
    end
  end

  def cancel_existing_timer
    EM.cancel_timer(@timer) if @timer
    AudioServicesStopSystemSound KSystemSoundID_Vibrate
  end

  def updater
    @label.text = "#{@slider.frequency.round(2)} Hz"
    cancel_existing_timer
    if @slider.frequency > 0
      @timer = EM.add_periodic_timer(1/@slider.frequency) { AudioServicesPlaySystemSoundWithVibration KSystemSoundID_Vibrate, nil, VIBE }
    end
  end
end
