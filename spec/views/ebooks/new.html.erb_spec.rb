require 'rails_helper'

RSpec.describe "ebooks/new", type: :view do
  before(:each) do
    assign(:ebook, Ebook.new(
      title: "MyString"
    ))
  end

  it "renders new ebook form" do
    render

    assert_select "form[action=?][method=?]", ebooks_path, "post" do

      assert_select "input[name=?]", "ebook[title]"
    end
  end
end
