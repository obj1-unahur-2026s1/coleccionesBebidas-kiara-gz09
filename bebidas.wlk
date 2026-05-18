
object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}
 
object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoFrutas {
  var nutrientes = [leche.nutriente(), banana.nutriente(), hielo.nutriente()]
  method agregarIngrediente(unIngrediente) {
    nutrientes.add(unIngrediente.nutriente())
  }
  method rendimientoQueOtorga(dosisConsumida) = nutrientes.sum() * (dosisConsumida/1000)
}

object aguaSaborizada {
  
}

//INGREDIENTES
object leche{
  const valor = 20
  method nutriente() = valor  
}
object banana{
  const valor = 30
  method nutriente() = valor  
}
object hielo{
  const valor = 0
  method nutriente() = valor  
}

object agua {
  const valor = 1
  method nutriente() = valor 
}