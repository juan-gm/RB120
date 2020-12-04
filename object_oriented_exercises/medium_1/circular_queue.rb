require 'pry'
=begin
- Crear queue circular, que será un array
- Crear un puntero apuntando al objecto más antiguo, que
llamaremos oldest_index
- Crear un puntero apuntando al lugar donde se situará el
próximo objecto que creemos, que llamaremos newest_index
Posibles acciones:
- Enqueue para añadir un objeto nuevo a la queue. Pueden
pasar dos cosas:
  - Que la queue ya esté llena. En este caso al añadir
  un nuevo objeto este se añade en donde estaba el objeto
  más antiguo, es decir donde estaba apuntando oldest_index
  Ahora oldest_index apunta a la siguiente posición y 
  newest_index apunta a la misma posición que oldest_index
  - Que haya espacio en la queue. En este caso añadimos el
  objeto a donde apunte newest_index. Newest_index apunta
  al siguiente lugar y oldest_index no varía.
- Dequeue para eliminar y devolver el objeto más viejo.
Pueden pasar dos cosas:
  - Que el buffer esté vacío, en cuyo caso devolvemos empty
  - Que haya objeto(s). En este caso devolvemos el objeto
  y lo eliminamos. Oldest queue apunta al siguiente index.
=end

class CircularQueue
  attr_accessor :queue, :oldest_index, :newest_index

  def initialize(size)
    @oldest_index = 0
    @queue = Array.new(size)
    @newest_index = 0
  end

  def enqueue(value)
    if full?
      self.queue[oldest_index] = value
      update_oldest_index
      self.newest_index = oldest_index
    else
      self.queue[newest_index] = value
      update_newest_index
    end
  end

  def dequeue
    if empty?
      nil
    else
      pos = queue[oldest_index]
      self.queue[oldest_index] = nil
      update_oldest_index
      pos
    end
  end

  private

  def update_oldest_index
    self.oldest_index += 1
    if oldest_index >= queue.size
      self.oldest_index = 0
    end
  end

  def update_newest_index
    self.newest_index += 1
    if newest_index >= queue.size
      self.newest_index = 0
    end
  end

  def full?
    queue.all? { |value| value != nil }
  end

  def empty?
    queue.all? { |value| value == nil }
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil