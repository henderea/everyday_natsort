# coding: utf-8
require 'rspec'
require_relative '../../lib/everyday_natsort'

def test_fixes_char(str, char, count)
  str2 = EverydayNatsort.strip_accents(str)
  expect(str2).to eq (char * count)
end

describe 'accents' do
  it 'fixes A' do
    str = 'ÀÁÂÃÄÅĀĂĄ'
    test_fixes_char(str, 'A', 9)
  end
  it 'fixes a' do
    str = 'àáâãäåāăą'
    test_fixes_char(str, 'a', 9)
  end
  it 'fixes AE' do
    str = 'Æ'
    test_fixes_char(str, 'AE', 1)
  end
  it 'fixes ae' do
    str = 'æ'
    test_fixes_char(str, 'ae', 1)
    end
  it 'fixes C' do
    str = 'ÇĆĈĊČ'
    test_fixes_char(str, 'C', 5)
    end
  it 'fixes c' do
    str = 'çćĉċč'
    test_fixes_char(str, 'c', 5)
  end
end