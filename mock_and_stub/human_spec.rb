require_relative 'human'

RSpec.describe 'Human' do
  it 'feeds a dog' do
    name = double('Joe')

    allow(name).to receive(:feed_pet).with('Dog')
    # mock

    ih = Human.new(name)
    ih.feed_pet('Dog')
  end

  it 'gets a salary' do
    salary = Human.new('Joe')

    allow(salary).to receive(:receive_salary).and_return(salary)
    # stub

    expect(salary.receive_salary).to eq(salary)
  end
end
