require 'spec_helper'

describe Book do

  before { @book = Book.new(title: "The Google story", author: "David A. Vise, Mark Malseed", coverThumb: "http://www.bookthumburl.com", coverMedium: "http://www.bookmediumurl.com", publisher: "Random House Digital, Inc.", publishDate: "2005-11-15", description: "Here is the story behind one of the most remarkable Internet successes of our time. Based on scrupulous research and extraordinary access
  to Google, ...") }

  subject { @book }

  #validating presence of book information
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:coverThumb) }
  it { should respond_to(:coverMedium) }
  it { should respond_to(:publisher) }
  it { should respond_to(:publishDat) }
  it { should respond_to(:description) }
end
