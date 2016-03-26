require 'test_helper'

class PeerToPeersControllerTest < ActionController::TestCase
  setup do
    @peer_to_peer = peer_to_peers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peer_to_peers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peer_to_peer" do
    assert_difference('PeerToPeer.count') do
      post :create, peer_to_peer: { message: @peer_to_peer.message, reciever: @peer_to_peer.reciever, sender: @peer_to_peer.sender, subject: @peer_to_peer.subject }
    end

    assert_redirected_to peer_to_peer_path(assigns(:peer_to_peer))
  end

  test "should show peer_to_peer" do
    get :show, id: @peer_to_peer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peer_to_peer
    assert_response :success
  end

  test "should update peer_to_peer" do
    patch :update, id: @peer_to_peer, peer_to_peer: { message: @peer_to_peer.message, reciever: @peer_to_peer.reciever, sender: @peer_to_peer.sender, subject: @peer_to_peer.subject }
    assert_redirected_to peer_to_peer_path(assigns(:peer_to_peer))
  end

  test "should destroy peer_to_peer" do
    assert_difference('PeerToPeer.count', -1) do
      delete :destroy, id: @peer_to_peer
    end

    assert_redirected_to peer_to_peers_path
  end
end
