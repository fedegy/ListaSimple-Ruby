class Nodo
    attr_accessor :dato, :siguiente, :id
    def initialize(id, dato, siguiente)
        self.id = id
        self.dato = dato
        self.siguiente = siguiente
    end
end

class ListaSimple
    attr_accessor :primero, :ultimo, :contador
    def initialize
        self.primero = nil
        self.ultimo = nil
        self.contador = 0
    end

    def insertar(dato)
        self.contador += 1
        nuevo = Nodo.new(self.contador, dato, nil)
        if self.primero == nil
            self.primero = self.ultimo = nuevo
        else
            self.ultimo.siguiente = nuevo
            self.ultimo = nuevo
        end
    end
    
    def mostrar
        dot = ""
        temp = self.primero

        dot += "digraph Lista_Simple{\n"
        dot += "rankdir = LR;"
        dot += "node [style=filled];\n"
        dot += "label=\"Lista Simple Enlazada\"\n"
        dot += "color=black\n"

        while temp != nil
            if temp == self.primero
                dot += "\"" + "n_" + temp.to_s + "\"" + "[label = \"Dato: " + temp.dato + "\", shape = box, color = \"#3396FF\"];\n"
            elsif temp == self.ultimo
                dot += "\"" + "n_" + temp.to_s + "\"" + "[label = \"Dato: " + temp.dato + "\", shape = box, color = \"#884EA0\"];\n"
            else
                dot += "\"" + "n_" + temp.to_s + "\"" + "[label = \"Dato: " + temp.dato + "\", shape = box, color = \"#82E0AA\"];\n"
            end
            if temp.siguiente != nil
                dot += "\"n_" + temp.to_s + "\" -> " + "\"n_" + temp.siguiente.to_s + "\";\n"
            end
            temp = temp.siguiente
        end
        file = File.new("lista_simple.dot", "w")
        file.puts(dot)
        file.puts("}\n")
        file.close
    end
end

lista = ListaSimple.new
while true
    puts "1) Ingresar dato"
    puts "2) Mostrar"
    puts "Ingrese opcion"
    op = Integer(gets)

    if op == 1
        puts "Ingrese dato: "
        dato = gets
        lista.insertar(dato)
    elsif op == 2
        lista.mostrar
    else
        puts "No ingreso una opcion valida"
    end
end