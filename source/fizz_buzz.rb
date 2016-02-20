class Numeric
  def est_multiple_de(n)
    self % n == 0
  end
end

class FizzBuzz

  def liste
    Array.new(100) { |i|
      generer_affichage_pour_nombre(i + 1)
    }
  end

  private
  def generer_affichage_pour_nombre(nombre)
    if nombre.est_multiple_de(3) or nombre.est_multiple_de(5)
      r = ""
      if nombre.est_multiple_de 3
        r << "fizz"
      end
      if nombre.est_multiple_de 5
        r << "buzz"
      end
      r
    else
      "#{nombre}"
    end
  end
  
  def est_fizz(nombre)
    nombre % 3 == 0
  end
end
