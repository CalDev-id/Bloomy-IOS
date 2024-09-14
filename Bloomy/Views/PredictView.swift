//
//  PredictView.swift
//  Bloomy
//
//  Created by Heical Chandra on 12/08/24.
//

import SwiftUI

struct PredictView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @StateObject private var classifier = ImageClassifier()
    @State private var toggleResult: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Color.white
                    .cornerRadius(20)
                    .padding(.top, 230)
                    .ignoresSafeArea()
            }
            .background(Color.biru3)
            
            VStack {
                HStack {
                    VStack(alignment:.leading) {
                        Text("Fish Grading")
                        Text("Grade your fish \nunveil the quality in every catch!")
                            .font(.system(size: 20))
                            .padding(.vertical, 5)
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 70)
    
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 45, height: 200)
                        .cornerRadius(16)
                        .scaledToFit()
                } else {
                    VStack {
                        Image("chooseIMG")
                        Text("Choose Image")
                            .foregroundColor(Color.color)
                            .fontWeight(.semibold)
                    }
                    .frame(width: UIScreen.main.bounds.width - 45, height: 200)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                }
    
                PrimaryBTN(name: "Take From Camera", todo: {
                    imagePickerSourceType = .camera
                    isImagePickerPresented = true
                })
                .padding(.vertical, 20)
    
                PrimaryBTN(name: "Select From Gallery", todo: {
                    imagePickerSourceType = .photoLibrary
                    isImagePickerPresented = true
                })
    
                Spacer()
    
                PrimaryBTN(name: "Grade", todo: {
                    if let image = selectedImage {
                        classifier.classifyImage(image: image)
                        toggleResult = true
                    }
                })
    
                Spacer(minLength: 0)
            }
            
            if toggleResult {
                VStack {
                    VStack {
                        Text("This \(classifier.classificationResult) is grade \(classifier.gradingResult)")
                            .foregroundColor(Color.color)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .padding(.bottom, 1)
                        Text("This fish is in excellent condition, displaying vibrant colors, firm flesh, and clear eyes. It meets the highest standards of freshness and quality")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .frame(alignment: .center)
                        Button(action: {
                            toggleResult = false
                        }) {
                            Text("Close")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .frame(width: UIScreen.main.bounds.width - 80, height: 40)
                        .background(Color.color)
                        .cornerRadius(10)
                    }
                    .frame(width: UIScreen.main.bounds.width - 45, height: 200)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.black.opacity(0.45))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage, sourceType: imagePickerSourceType)
        }
    }
}

#Preview {
    PredictView()
}
