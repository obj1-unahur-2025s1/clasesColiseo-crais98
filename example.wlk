class ArmaFilo{
  var filo
  var longitud 
  method daño() = 0.max(filo).min(1)*longitud
}

class ArmaContundente{
  var peso
  method daño() = peso
}

class mirmillones{
  var salud = 100
  var arma
  var armadura
  var fuerza
  var daño = 0
  method cambiarArmaA(unArma){
    arma = unArma
  }
  method puntosArmadura(){
    if(armadura==casco) 10 else 5 + self.destreza()*0.1
  }// objeto o string en condición
  method defensa() = self.puntosArmadura + destreza
  method destreza() = 15
  method cambiarArmadura(unaArmadura){
    armadura = unaArmadura
  }
  method fuerza() = fuerza
  method atacar(unOponente){
    unOponente.recibirDaño(self, 0.max(poderDeAtaque() - unOponente.defensa()))
  }
  method poderDeAtaque() = arma.daño() + fuerza
  method recibirDaño(unOponente, cantidad){
    salud = 0.max(salud - cantidad)
  }
  method pelearCon(unOponente){
    if(unOponente.salud() > 0){ // será necesario preguntar la salud de self?
       self.atacar(unOponente)
       unOponente.atacar(self)
    }
  }
  method salud() = salud
}

class dimachaerus{
  const armas = []
  var salud = 100
  var destrezas
  method cambiarArmaA(unArma){} // deberia ser distinto, agrega el arma a la lista y descarta la que tiene actualmente?
  method defensa()= 0.max(destreza/2)
  method destreza() = destreza 
  method cambiarArmadura(unaArmadura){}// no es necesario
  method fuerza() = 10
  method poderDeAtaque() = self.fuerza() + armas.sum({a=>a.daño()})
  method atacar(unOponente){
    unOponente.recibirDaño(self, 0.max(poderDeAtaque() - unOponente.defensa()))
    destreza = destreza + 1
  }
  method recibirDaño(unOponente, cantidad){
    salud = 0.max(salud - cantidad)
  }
  method pelearCon(unOponente){
    if(unOponente.salud() > 0){ // será necesario preguntar la salud de self?
       self.atacar(unOponente)
       unOponente.atacar(self)
    }
  }
  method salud() = salud
}