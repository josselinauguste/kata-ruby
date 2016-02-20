class Numeric
  def nombre_degres
    self.to_s.length - 1
  end
end

class ConvertisseurRomanNumerals

  ALPHABET = [{lettre: "I", nombre: 1}, {lettre: "V", nombre: 5}, {lettre: "X", nombre: 10}, {lettre: "L", nombre: 50}, {lettre: "C", nombre: 100}, {lettre: "D", nombre: 500}, {lettre: "M", nombre: 1000}].reverse

  def initialize(nombre)
    @nombre = nombre
    @resultat = ""
  end

  def conversion
    convertir_nombre() if @resultat.empty?
    @resultat
  end

  private
  def convertir_nombre
    @nombre.nombre_degres.downto(1) do |i|
      soustrat = (@nombre / 10 ** i).to_i * (10 ** i)
      convertir_composante(soustrat)
      @nombre -= soustrat
    end
    convertir_composante(@nombre)
  end

  def convertir_composante(composante)
    ALPHABET.each_index do |i|
      composante = ajouter_prefixe(composante, i)
      composante = ajouter_suffixe(composante, i)
    end
  end

  def ajouter_prefixe(composante, index_nombre)
    for j in (index_nombre + 1)..(ALPHABET.length - 1)
      prefixe_potentiel = ALPHABET[j]
      if composante != prefixe_potentiel[:nombre] and composante == ALPHABET[index_nombre][:nombre] - prefixe_potentiel[:nombre]
        composante += prefixe_potentiel[:nombre]
        @resultat += prefixe_potentiel[:lettre]
      end
    end
    composante
  end

  def ajouter_suffixe(composante, index_nombre)
    nombre_courant = ALPHABET[index_nombre][:nombre]
    while composante >= nombre_courant
      composante -= nombre_courant
      lettre_courante = ALPHABET[index_nombre][:lettre]
      @resultat += lettre_courante
    end
    composante
  end
end
