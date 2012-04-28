require './line_trimmer'


describe LineTrimmer do

  it "does nothing for empty string" do
    subject.trim("").should == ""
  end

  it "does nothing when there's no white space at the end" do
    subject.trim("abc").should == "abc"
  end

  it "eliminate space at the end of a word" do
    subject.trim("abc ").should == "abc"
  end

  it "eliminate multiple spaces at the end of a word" do
    subject.trim("abc  ").should == "abc"
  end

  it "eliminates tab at the end of the word" do
    subject.trim("abc\t").should == "abc"
  end

  it "eliminates multiple tabs at the end of the word" do
    subject.trim("abc\t\t").should == "abc"
  end

  it "eliminates tab and space at the end of the word" do
    subject.trim("abc \t").should == "abc"
    subject.trim("abc\t ").should == "abc"
  end

  it "doesn't eliminate space at the beginning of the word" do
    subject.trim(" abc").should == " abc"
  end

  it "does nothing when no line contains ending white space" do
    subject.trim("ab\ncd\n").should == "ab\ncd\n"
  end

  it "eliminates ending white space for all the lines" do
    subject.trim("ab\n cd \n").should == "ab\n cd\n"
  end

end

describe "White space at the end of String" do

  it "returns index of first white space when ends with whte space" do
    "hello \t\t ".index_of_first_ending_white_space.should == 5
  end

  it "returns nil when doesn't end with white space" do
    "hello \t abc\t\t d".index_of_first_ending_white_space.should be_nil
  end

end
