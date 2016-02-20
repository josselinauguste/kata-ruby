class Bowling

  class Frame

    attr_writer :next

    def initialize
      @rolls_hits = []
      @next = nil
    end

    def roll(h)
      @rolls_hits << h
    end

    def full?
      @rolls_hits.length == 2 or strike?
    end

    def score_with_bonus
      acc = score
      bonus_rolls = strike? ? 2 : spare? ? 1 : 0
      if bonus_rolls and @next
        acc += @next.following_rolls_hits(bonus_rolls)
      end
      acc
    end

    protected
    def following_rolls_hits(n)
      hits = 0
      @rolls_hits.each_index do |i|
        if n > 0 and @rolls_hits.length > i
          hits += @rolls_hits[i]
          n -= 1
        end
      end
      if n > 0 and not @next.nil?
        hits += @next.following_rolls_hits n
      end
      hits
    end

    private
    def spare?
      score == 10 and @rolls_hits.length == 2
    end

    def strike?
      @rolls_hits.first == 10
    end

    def score
      @rolls_hits.reduce :+
    end
  end

  def initialize
    @frames = [Frame.new]
  end

  def roll(n)
    fetch_frame_to_roll().roll n
  end

  def score
    @frames.take(10).collect { |f| f.score_with_bonus }.reduce :+
  end

  private
  def fetch_frame_to_roll
    if @frames.last.full?
      f = Frame.new
      @frames.last.next = f
      @frames << f
    end
    @frames.last
  end
end
