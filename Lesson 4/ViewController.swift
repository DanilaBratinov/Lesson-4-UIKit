import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        self.setupSlider()
        self.setupMainLabel()
        
    }
    
    // MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "One"
        case 1:
            mainLabel.text = "Two!"
        case 2:
            mainLabel.text = "Three!"
        default:
            break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
        mainLabel.text = inputText
    }
    
    @IBAction func datePickerAction() {
        mainLabel.text = datePicker.date.formatted(date: .long, time: .omitted)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        switchLabel.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    //MARK: - Private Method
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
