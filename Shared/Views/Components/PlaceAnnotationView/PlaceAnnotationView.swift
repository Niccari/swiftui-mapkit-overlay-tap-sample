import UIKit
import MapKit

final class PlaceAnnotationView: UIView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!

    init() {
        super.init(frame: .zero)
        loadFromNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }

    private func loadFromNib() {
        let nib = UINib(
            nibName: "PlaceAnnotationView",
            bundle: nil
        )
        guard let view = nib.instantiate(withOwner: self).first as? UIView else {
            fatalError("failed to load nib.")
        }
        addSubview(view)
    }

    func configure(for annotation: PlaceAnnotation) {
        self.title.text = annotation.name
        self.subtitle.text = annotation.detail
    }
}

class PlaceAnnotation: MKPointAnnotation {
    var name: String
    var detail: String

    init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
