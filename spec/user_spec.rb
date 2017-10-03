require('spec_helper')


describe(User) do
  it("ensures the length of password is at least 8 characters") do
    user = User.new({:password => "a".*(6)})
    expect(user.save()).to(eq(false))
  end
  it("ensures the length of password is at most 25 characters") do
    user = User.new({password: "a".*(26)})
    expect(user.save()).to(eq(false))
  end
end
