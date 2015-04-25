require 'spec_helper'
require 'json-rpc2rest'

shared_examples_for 'change env' do 
  it 'should change PATH_INFO and REQUEST_URI' do
    expect(app).to receive(:call).with(result_env)
    obj.call(env)
  end
end

shared_examples_for "don't change env" do 
  it 'should change PATH_INFO and REQUEST_URI' do
    expect(app).to receive(:call).with(env)
    obj.call(env)
  end
end

describe JsonRpc2Rest do
  let(:obj) { described_class.new(app) }
  let(:app) { double('app') }
  let(:params) { '' }
  before(:each) do
    allow_any_instance_of(Rack::Request).
      to receive_message_chain(:body, :read).and_return(params)
  end

  it 'takes a backend and returns a middleware component' do
    expect(obj).to respond_to(:call)
  end

  it 'takes an options Hash' do
    expect { described_class.new(app, {}) }.
      not_to raise_error
  end

  context 'when json-rpc params' do
    let(:params) { {'method'=>'get_posts_list', 'data' => [], 'id'=>'2'}.to_json }
    let(:env) {
      {'REQUEST_METHOD' => 'POST', 
       # 'rack.request.form_hash' => params,
       'PATH_INFO' => '/api',
       'REQUEST_URI'  => '/api?page=2'
      }
    }
    let(:result_env) {
      env.merge({
        'PATH_INFO' => '/api/get_posts_list',
        'REQUEST_URI'  => '/api/get_posts_list?page=2'
      })
    }

    it_should_behave_like 'change env'

    context 'when PATH_INFO with trailing slash' do
      let(:env) {
        {'REQUEST_METHOD' => 'POST', 
         # 'rack.request.form_hash' => params,
         'PATH_INFO' => '/api/',
         'REQUEST_URI'  => '/api/?page=2'
        }
      }

      it_should_behave_like 'change env'
    end

    context 'when method is not defined in params' do
      let(:params) { {'data' => [], 'id'=>'2'}.to_json }

      it_should_behave_like "don't change env"
    end

    context 'when method field changed' do
      let(:params) { {'requestMethod'=>'get_posts_list', 'data' => [], 'id'=>'2'}.to_json }
      let(:obj) { described_class.new(app, {field: 'requestMethod'}) }
      it_should_behave_like 'change env'
    end
  end

  context 'when get request' do
    let(:env) {
      {'REQUEST_METHOD' => 'GET', 
       'PATH_INFO' => '/api',
       'REQUEST_URI'  => '/api?page=2'
      }
    }

    it_should_behave_like "don't change env"
  end

end