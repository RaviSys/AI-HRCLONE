require 'rails_helper'

RSpec.describe "ebooks/edit", type: :view do
  before(:each) do
    @ebook = assign(:ebook, Ebook.create!(
      title: "MyString"
    ))
  end

  it "renders the edit ebook form" do
    render

    assert_select "form[action=?][method=?]", ebook_path(@ebook), "post" do

      assert_select "input[name=?]", "ebook[title]"
    end
  end
end
