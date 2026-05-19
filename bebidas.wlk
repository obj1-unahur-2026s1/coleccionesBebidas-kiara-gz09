
object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}
 
object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object agua {
  method rendimientoQueOtorga(dosisConsumida) = 1
}

object licuadoFrutas {
  var property nutrientes = [leche.nutriente(), banana.nutriente(), hielo.nutriente()]
  method agregarIngrediente(unIngrediente) {
    nutrientes.add(unIngrediente.nutriente())
  }
  method rendimientoQueOtorga(dosisConsumida) = nutrientes.sum() * (dosisConsumida/1000)
}

object aguaSaborizada {
  var bebida25 = whisky
  method cambiarBebida(otraBebida) {
    bebida25 = otraBebida
  }
  method rendimientoQueOtorga(dosisConsumida) = agua.rendimientoQueOtorga(dosisConsumida) + bebida25.rendimientoQueOtorga(dosisConsumida*0.25)
}

object coctel {
  var property composicion = [whisky, agua, licuadoFrutas]
  const cantBebidas = composicion.size()
  method agregarIngrediente(unIngrediente) {
    composicion.add(unIngrediente)
  }
  method rendimientoQueOtorga(dosisConsumida){
    const proporcion = dosisConsumida / cantBebidas
    var rendimiento = 1
    composicion.forEach({ b => rendimiento * b.rendimientoQueOtorga(proporcion)})
    return rendimiento
  }
}

// INGREDIENTES
object leche{
  const valor = 20
  method nutriente() = valor  
}
object banana{
  const valor = 30
  method nutriente() = valor  
}
object hielo{
  const valor = 1
  method nutriente() = valor  
}

