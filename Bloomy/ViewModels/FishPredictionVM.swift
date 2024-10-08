//import SwiftUI
//
//class ImageClassifier: ObservableObject {
//    @Published var classificationResult: String = ""
//    @Published var gradingResult: String = ""
//
//    func classifyImage(image: UIImage) {
//        guard let url = URL(string: "https://bloomy-flask-production.up.railway.app/marine-grading/") else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "accept")
//        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
//
//        let boundary = UUID().uuidString
//        let boundaryPrefix = "--\(boundary)\r\n"
//        let boundarySuffix = "\r\n--\(boundary)--\r\n"
//
//        var body = Data()
//        body.appendString(boundaryPrefix)
//        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"image.png\"\r\n")
//        body.appendString("Content-Type: image/png\r\n\r\n")
//        body.append(image.pngData()!)
//        body.appendString(boundarySuffix)
//
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        request.httpBody = body
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("Invalid response from server")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            // Debugging: Print the raw JSON response
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("Raw JSON response: \(jsonString)")
//            }
//
//            guard let predictionResponse = try? JSONDecoder().decode(PredictionResponse.self, from: data) else {
//                print("Failed to decode JSON response")
//                return
//            }
//
//            DispatchQueue.main.async {
//                self.classificationResult = predictionResponse.predicted_class
//                self.gradingResult = predictionResponse.grading_result
//            }
//        }
//
//        task.resume()
//    }
//}
//
//extension Data {
//    mutating func appendString(_ string: String) {
//        if let data = string.data(using: .utf8) {
//            append(data)
//        }
//    }
//}


import SwiftUI

class ImageClassifier: ObservableObject {
    @Published var classificationResult: String = ""
    @Published var gradingResult: String = ""
    @Published var isResult: Bool = false

    func classifyImage(image: UIImage) {
        guard let compressedImage = compressImage(image) else {
            print("Failed to compress image")
            return
        }

        guard let url = URL(string: "https://parallel-arabelle-waifu-ical-cd5f2cfe.koyeb.app/marine-grading/") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")

        let boundary = UUID().uuidString
        let boundaryPrefix = "--\(boundary)\r\n"
        let boundarySuffix = "\r\n--\(boundary)--\r\n"

        var body = Data()
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n")
        body.appendString("Content-Type: image/jpeg\r\n\r\n")
        body.append(compressedImage)
        body.appendString(boundarySuffix)

        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response from server")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            // Debugging: Print the raw JSON response
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }

            guard let predictionResponse = try? JSONDecoder().decode(PredictionResponse.self, from: data) else {
                print("Failed to decode JSON response")
                return
            }

            DispatchQueue.main.async {
                self.classificationResult = predictionResponse.predicted_class
                self.gradingResult = predictionResponse.grading_result
                self.isResult = true
            }
        }

        task.resume()
    }

    // Function to compress the image
    private func compressImage(_ image: UIImage) -> Data? {
        return image.jpegData(compressionQuality: 0.1) // Compress to 50% quality
    }
}

extension Data {
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
