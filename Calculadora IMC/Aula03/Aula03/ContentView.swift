
import SwiftUI

struct ContentView: View {
    
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imc: Double = 0.0
    @State private var status: String = "Insira seus dados"
    @State private var BGcolor : Color = Color.white
    @State private var imagemIMC:Image = Image("imc")
    
    var body: some View {
        ZStack{
            
            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .fontWeight(.semibold).padding(.bottom, 10.0)
                
                
                TextField("Peso", text: $peso).multilineTextAlignment(.center).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.95))
                    .frame(width: 250.0) .cornerRadius(5)
                
                
                TextField("Altura", text: $altura).multilineTextAlignment(.center).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.95))
                    .frame(width: 250.0) .cornerRadius(5)
                
                
                Button(action:{ if let pesoDouble = Double(peso), let alturaDouble = Double(altura), alturaDouble > 0 {
                    imc = pesoDouble / (alturaDouble * alturaDouble)
                    
                    if imc < 18.5 && imc > 0.0{
                        status = "Baixo Peso"
                        BGcolor = (Color("baixopeso"))
                        imagemIMC = Image("imgbaixopeso")
                        
                    }
                    else if imc < 24.99 && imc > 18.5{
                        status = "Normal"
                        BGcolor = (Color("normal"))
                        imagemIMC = Image("imgok")
                    }
                    else if imc < 29.99 && imc > 25.0{
                        status = "Sobrepeso"
                        BGcolor = (Color("sobrepeso"))
                        imagemIMC = Image("imgsobrepeso")
                    }
                    else{
                        status = "Obesidade!"
                        BGcolor = (Color("obesidade"))
                        imagemIMC = Image("imgobesidade")
                    }
                }else{
                    imc = 0.0
                    BGcolor = (Color.white)
                    status = "Insira seus dados"
                    imagemIMC
                   
                }
                }
                ) {
                    HStack{
                        Image(systemName: "play.circle")
                            .foregroundColor(Color.white)
                        Text("Calcular")
                        
                        
                    }
                }.buttonStyle(.borderedProminent).padding()
                
                Spacer()
                VStack{
                    
                    imagemIMC.resizable().scaledToFill().padding(.horizontal, 300.0).frame(width: 240.0, height: 200.0)
                    
                    
                    Text("\(status)")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                
                Spacer()
                VStack{
                    Image("tabela").resizable().scaledToFit().shadow(radius: 10)
                }
            }
            
        }.background(BGcolor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
