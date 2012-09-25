# encoding: utf-8
# --
# The MIT License (MIT)
#
# Copyright (C) 2012 Gitorious AS
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#++
require "test_helper"
require "em_rugged/repository"

describe EMRugged::Repository do
  include EM::MiniTest::Spec

  describe "#rev_parse" do
    it "returns deferrable" do
      deferrable = EMRugged::Repository.new(".").rev_parse("master:")
      assert deferrable.respond_to?(:callback)
      assert deferrable.respond_to?(:errback)
    end

    it "yields object" do
      deferrable = EMRugged::Repository.new(".").rev_parse("master:")
      deferrable.callback do |tree|
        assert Rugged::Tree === tree
        done!
      end
      wait!
    end

    it "yields error" do
      deferrable = EMRugged::Repository.new(".").rev_parse("blehbleh")
      deferrable.errback do |err|
        assert Rugged::ReferenceError === err
        done!
      end
      wait!
    end
  end

  describe "#refs" do
    it "returns deferrable" do
      deferrable = EMRugged::Repository.new(".").refs
      assert deferrable.respond_to?(:callback)
      assert deferrable.respond_to?(:errback)
    end

    it "yields array" do
      deferrable = EMRugged::Repository.new(".").refs
      deferrable.callback do |tree|
        assert Array === tree
        done!
      end
      wait!
    end
  end
end
