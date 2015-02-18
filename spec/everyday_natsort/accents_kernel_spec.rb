# coding: utf-8
require 'rspec'
require_relative '../../lib/everyday_natsort_kernel'

def test_fixes_char(str, char, count)
  str2 = str.strip_accents
  expect(str2).to eq (char * count)
end

describe 'accents (kernel)' do
  it 'fixes A' do
    str = 'ÀÁÂÃÄÅĀĂĄA'
    test_fixes_char(str, 'A', 10)
  end
  it 'fixes a' do
    str = 'àáâãäåāăąa'
    test_fixes_char(str, 'a', 10)
  end
  it 'fixes AE' do
    str = 'ÆAE'
    test_fixes_char(str, 'AE', 2)
  end
  it 'fixes ae' do
    str = 'æae'
    test_fixes_char(str, 'ae', 2)
  end
  it 'fixes C' do
    str = 'ÇĆĈĊČC'
    test_fixes_char(str, 'C', 6)
  end
  it 'fixes c' do
    str = 'çćĉċčc'
    test_fixes_char(str, 'c', 6)
  end
  it 'fixes D' do
    str = 'ĎĐD'
    test_fixes_char(str, 'D', 3)
  end
  it 'fixes d' do
    str = 'ďđd'
    test_fixes_char(str, 'd', 3)
  end
  it 'fixes E' do
    str = 'ÈÉÊËĒĔĖĘĚE'
    test_fixes_char(str, 'E', 10)
  end
  it 'fixes e' do
    str = 'èéêëēĕėęěe'
    test_fixes_char(str, 'e', 10)
  end
  it 'fixes G' do
    str = 'ĜĞĠĢG'
    test_fixes_char(str, 'G', 5)
  end
  it 'fixes g' do
    str = 'ĝğġģg'
    test_fixes_char(str, 'g', 5)
  end
  it 'fixes H' do
    str = 'ĤĦH'
    test_fixes_char(str, 'H', 3)
  end
  it 'fixes h' do
    str = 'ĥħh'
    test_fixes_char(str, 'h', 3)
  end
  it 'fixes I' do
    str = 'ÌÍÎÏĨĪĬĮİI'
    test_fixes_char(str, 'I', 10)
  end
  it 'fixes i' do
    str = 'ìíîïĩīĭįıi'
    test_fixes_char(str, 'i', 10)
  end
  it 'fixes IJ' do
    str = 'ĲIJ'
    test_fixes_char(str, 'IJ', 2)
  end
  it 'fixes ij' do
    str = 'ĳij'
    test_fixes_char(str, 'ij', 2)
  end
  it 'fixes J' do
    str = 'ĴJ'
    test_fixes_char(str, 'J', 2)
  end
  it 'fixes j' do
    str = 'ĵj'
    test_fixes_char(str, 'j', 2)
  end
  it 'fixes K' do
    str = 'ĶK'
    test_fixes_char(str, 'K', 2)
  end
  it 'fixes k' do
    str = 'ķk'
    test_fixes_char(str, 'k', 2)
  end
  it 'fixes L' do
    str = 'ĹĻĽĿŁL'
    test_fixes_char(str, 'L', 6)
  end
  it 'fixes l' do
    str = 'ĺļľŀłl'
    test_fixes_char(str, 'l', 6)
  end
  it 'fixes N' do
    str = 'ÑŃŅŇŊN'
    test_fixes_char(str, 'N', 6)
  end
  it 'fixes n' do
    str = 'ñńņňŉŋn'
    test_fixes_char(str, 'n', 7)
  end
  it 'fixes O' do
    str = 'ÒÓÔÕÖØŌŎŐO'
    test_fixes_char(str, 'O', 10)
  end
  it 'fixes o' do
    str = 'òóôõöøōŏőo'
    test_fixes_char(str, 'o', 10)
  end
  it 'fixes OE' do
    str = 'ŒOE'
    test_fixes_char(str, 'OE', 2)
  end
  it 'fixes oe' do
    str = 'œoe'
    test_fixes_char(str, 'oe', 2)
  end
  it 'fixes R' do
    str = 'ŔŖŘR'
    test_fixes_char(str, 'R', 4)
  end
  it 'fixes r' do
    str = 'ŕŗřr'
    test_fixes_char(str, 'r', 4)
  end
  it 'fixes S' do
    str = 'ŚŜŞŠS'
    test_fixes_char(str, 'S', 5)
  end
  it 'fixes s' do
    str = 'śŝşšs'
    test_fixes_char(str, 's', 5)
  end
  it 'fixes T' do
    str = 'ŢŤŦT'
    test_fixes_char(str, 'T', 4)
  end
  it 'fixes t' do
    str = 'ţťŧt'
    test_fixes_char(str, 't', 4)
  end
  it 'fixes U' do
    str = 'ÙÚÛÜŨŪŬŮŰŲU'
    test_fixes_char(str, 'U', 11)
  end
  it 'fixes u' do
    str = 'ùúûüũūŭůűųu'
    test_fixes_char(str, 'u', 11)
  end
  it 'fixes W' do
    str = 'ŴW'
    test_fixes_char(str, 'W', 2)
  end
  it 'fixes w' do
    str = 'ŵw'
    test_fixes_char(str, 'w', 2)
  end
  it 'fixes x' do
    str = '×x'
    test_fixes_char(str, 'x', 2)
  end
  it 'fixes Y' do
    str = 'ÝŶŸY'
    test_fixes_char(str, 'Y', 4)
  end
  it 'fixes y' do
    str = 'ýÿŷy'
    test_fixes_char(str, 'y', 4)
  end
  it 'fixes Z' do
    str = 'ŹŻŽZ'
    test_fixes_char(str, 'Z', 4)
  end
  it 'fixes z' do
    str = 'źżžz'
    test_fixes_char(str, 'z', 4)
  end
  it 'fixes "' do
    str = '“”"'
    test_fixes_char(str, '"', 3)
  end
  it "fixes '" do
    str = "´‘’'"
    test_fixes_char(str, "'", 4)
  end
  it 'fixes -' do
    str = '‐‑‒–—―-'
    test_fixes_char(str, '-', 7)
  end
end