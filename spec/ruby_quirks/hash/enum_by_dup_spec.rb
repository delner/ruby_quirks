require 'spec_helper'

describe RubyQuirks::Hash::EnumByDup do
  let(:enum_by_dup_class) do
    stub_const 'CustomHash', Class.new(Hash)
    CustomHash.class_eval { include RubyQuirks::Hash::EnumByDup }
    CustomHash
  end
  subject { enum_by_dup_class }
  let(:enum_by_dup) { enum_by_dup_class.new }

  # Populate the hash with test values
  before(:each) do
    enum_by_dup[1] = 'a'
    enum_by_dup[2] = 'b'
    enum_by_dup[3] = 'c'
  end

  context "#select" do
    context "with a block" do
      subject { enum_by_dup.select { |k,v| k % 2 == 0 } }
      it { expect(subject).to be_a_kind_of(enum_by_dup_class) }
    end
    context "without a block" do
      subject { enum_by_dup.select }
      it { expect(subject).to be_a_kind_of(Enumerator) }
    end
  end
  context "#reject" do
    context "with a block" do
      subject { enum_by_dup.reject { |k,v| k % 2 == 0 } }
      it { expect(subject).to be_a_kind_of(enum_by_dup_class) }
    end
    context "without a block" do
      subject { enum_by_dup.reject }
      it { expect(subject).to be_a_kind_of(Enumerator) }
    end
  end
end