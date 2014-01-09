require 'spec_helper'

# 3N + 1
# N이 홀수일 때: 3 * n + 1
# N이 짝수일 때: n / 2
# N이 1이면 반환

def cycle(n)
  return [n] if n == 1

  if n % 2 == 0
    [n] + cycle(n / 2)
  else
    [n] + cycle(3 * n + 1)
  end
end

describe "#cycle" do
  it "should solve 3n + 1" do
    cycle(1).should == [1]
    cycle(2).should == [2, 1]
    cycle(3).should == [3, 10, 5, 16, 8, 4, 2, 1]
    cycle(4).should == [4, 2, 1]
  end
end



