require 'rails_helper'

RSpec.describe "ebooks/index", type: :view do
  before(:each) do
    assign(:ebooks, [
      Ebook.create!(
        title: "Title"
      ),
      Ebook.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of ebooks" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
