require 'dependency_bundle'

RSpec.describe DependencyBundle do
  describe '.create' do
    context 'without arguments' do
      subject { DependencyBundle.create }

      it 'returns an empty dependency bundle' do
        expect(subject.contents).to be_empty
      end
    end

    context 'with a block' do
      it 'executes the block in the context of a new dependency bundle' do
        bundle = DependencyBundle.create do
          inject! :foo, :bar
        end

        expect(bundle.foo).to eq :bar
      end
    end

    context 'with another dependency bundle' do
      let(:other) { DependencyBundle.create }

      it 'copies the contents of the other bundle' do
        other.inject!(:foo, :bar)

        expect(DependencyBundle.create(other).foo).to eq :bar
      end
    end

    context 'with a non-DependencyBundle argument' do
      it 'raises an error' do
        expect { DependencyBundle.create(:foo) }.to raise_error(TypeError, 'DependencyBundle.create called with type Symbol, expected DependencyBundle.')
      end
    end
  end

  describe '#inject' do
    let(:original_bundle) { DependencyBundle.create }
    let(:new_bundle)      { original_bundle.inject(:foo, :bar) }

    it 'returns a new bundle' do
      expect(new_bundle.object_id).not_to eq original_bundle.object_id
    end

    it 'injects the provided key and value' do
      expect(new_bundle.foo).to eq :bar
    end
  end
end
