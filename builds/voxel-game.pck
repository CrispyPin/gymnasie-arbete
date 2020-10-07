GDPC                                                                            %   L   res://.import/debug_texture.png-6791ba1f89ff6a166665cf5d5da92763.s3tc.stex  @^            �/�vSn�󃨃W���D   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex   f      �      ��s�U�AV
	��   res://Scenes/Chunk.tscn �	      B      1�	w�zS�
�4�z&    res://Scenes/DebugOverlay.tscn  0            �J����}S+�a���3+   res://Scenes/Game.tscn  @      u      LWK��ہ8M0��2   res://Scenes/Lobby.tscn �      #      1����s�r�|Jl   res://Scenes/MainMenu.tscn  �      ~      @��������]�RF�   res://Scenes/PauseMenu.tscn p      �      ����(rxl!p���   res://Scenes/Player.tscn              �~��eA���~\�֎|   res://Scenes/VoxelWorld.tscn $      *      e��#Ԡ!�F��WH�   res://Scripts/Chunk.gd.remap�~      (       mɳz�*<�Su$   res://Scripts/Chunk.gdc P%            ������5Z,�a��q$   res://Scripts/DebugOverlay.gd.remap        /       ��a�8��qv_��JT5�    res://Scripts/DebugOverlay.gdc  `:            >��7v�W�B9�*;   res://Scripts/Game.gd.remap P      '       M�����*+��e��:�   res://Scripts/Game.gdc  p?      �      ��!x�(.6�.o�W    res://Scripts/Globals.gd.remap  �      *       ���]�_��b���   res://Scripts/Globals.gdc    B      �       ѹ"{���_KV��ѱ��   res://Scripts/Lobby.gd.remap�      (       �z*���ə�fU�5	   res://Scripts/Lobby.gdc �B            �� �F�ȕ�^p�O�    res://Scripts/MainMenu.gd.remap �      +       _�1'�u��Qn�.�<�   res://Scripts/MainMenu.gdc  �H      �      ��h��g�iO�	�V    res://Scripts/PauseMenu.gd.remap�      ,       b����O�ev0Kph�   res://Scripts/PauseMenu.gdc �K      �      0�R4#��]-U��No�    res://Scripts/Player.gd.remap   @�      )       <y;�9Y;�k��S�   res://Scripts/Player.gdcpO      �	      \sW���,'Lg\���$   res://Scripts/PlayerHead.gd.remap   p�      -       �#�4����D�pcA�   res://Scripts/PlayerHead.gdcpY            {J�(�{�~�Y���{�$   res://Scripts/VoxelWorld.gd.remap   ��      -       �˚��!�$�����O   res://Scripts/VoxelWorld.gdc�]      �       Ek��dV�_5��    res://debug_texture.png.import  ``      {      r�8����@�ᦽ7V   res://debug_texture.tres�c      �       ��FS��F���=m��   res://default_env.tres  �d      �       um�`�N��<*ỳ�8   res://head_material.tres@e      �       �E��}�30|�1I+   res://icon.png  Ѐ      �      G1?��z�c��vN��   res://icon.png.import   �{      L      �-�?��ќ��t6�~M�   res://project.binary��      m      (m��ԝ��{���[gd_scene load_steps=5 format=2]

[ext_resource path="res://Scripts/Chunk.gd" type="Script" id=1]
[ext_resource path="res://debug_texture.tres" type="Material" id=2]

[sub_resource type="ArrayMesh" id=1]

[sub_resource type="ConcavePolygonShape" id=2]

[node name="Chunk" type="Spatial"]
script = ExtResource( 1 )

[node name="Mesh" type="MeshInstance" parent="."]
material_override = ExtResource( 2 )
mesh = SubResource( 1 )

[node name="StaticBody" type="StaticBody" parent="."]

[node name="CollisionShape" type="CollisionShape" parent="StaticBody"]
shape = SubResource( 2 )
              [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/DebugOverlay.gd" type="Script" id=1]

[node name="DebugOverlay" type="Panel"]
margin_right = 256.0
margin_bottom = 104.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Position" type="Label" parent="."]
margin_left = 8.0
margin_top = 8.0
margin_right = 120.0
margin_bottom = 72.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Rotation" type="Label" parent="."]
margin_left = 136.0
margin_top = 8.0
margin_right = 248.0
margin_bottom = 56.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="NetworkStatus" type="Label" parent="."]
margin_left = 8.0
margin_top = 80.0
margin_right = 120.0
margin_bottom = 104.0
__meta__ = {
"_edit_use_anchors_": false
}
             [gd_scene load_steps=7 format=2]

[ext_resource path="res://Scripts/Game.gd" type="Script" id=1]
[ext_resource path="res://Scenes/PauseMenu.tscn" type="PackedScene" id=2]
[ext_resource path="res://Scenes/DebugOverlay.tscn" type="PackedScene" id=3]
[ext_resource path="res://Scenes/VoxelWorld.tscn" type="PackedScene" id=4]

[sub_resource type="BoxShape" id=1]
extents = Vector3( 32, 0.5, 32 )

[sub_resource type="PlaneMesh" id=2]
size = Vector2( 4, 4 )

[node name="Game" type="Node"]
script = ExtResource( 1 )

[node name="PauseMenu" parent="." instance=ExtResource( 2 )]

[node name="DebugOverlay" parent="." instance=ExtResource( 3 )]

[node name="TempWorld" type="Spatial" parent="."]

[node name="Floor" type="StaticBody" parent="TempWorld"]

[node name="CollisionShape" type="CollisionShape" parent="TempWorld/Floor"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.5, 0 )
shape = SubResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="TempWorld/Floor"]
transform = Transform( 16, 0, 0, 0, 1, 0, 0, 0, 16, 0, 0, 0 )
mesh = SubResource( 2 )
material/0 = null

[node name="VoxelWorld" parent="." instance=ExtResource( 4 )]

[node name="Reticle" type="ColorRect" parent="."]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -2.0
margin_top = -2.0
margin_right = 2.0
margin_bottom = 2.0
__meta__ = {
"_edit_use_anchors_": false
}
           [gd_scene load_steps=3 format=2]

[ext_resource path="res://Scenes/MainMenu.tscn" type="PackedScene" id=1]
[ext_resource path="res://Scripts/Lobby.gd" type="Script" id=4]

[node name="Lobby" type="Node"]
script = ExtResource( 4 )

[node name="MainMenu" parent="." instance=ExtResource( 1 )]
             [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/MainMenu.gd" type="Script" id=1]

[node name="MainMenu" type="Panel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -256.0
margin_top = -164.0
margin_right = 256.0
margin_bottom = 164.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="HostButton" type="Button" parent="."]
margin_left = 64.0
margin_top = 56.0
margin_right = 192.0
margin_bottom = 80.0
text = "Host game"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="JoinButton" type="Button" parent="."]
margin_left = 64.0
margin_top = 96.0
margin_right = 192.0
margin_bottom = 120.0
text = "Join game"

[node name="InputIP" type="LineEdit" parent="."]
margin_left = 208.0
margin_top = 96.0
margin_right = 320.0
margin_bottom = 120.0
text = "127.0.0.1"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="InputPort" type="LineEdit" parent="."]
margin_left = 208.0
margin_top = 56.0
margin_right = 320.0
margin_bottom = 80.0
text = "4242"
[connection signal="pressed" from="HostButton" to="." method="_on_HostButton_pressed"]
[connection signal="pressed" from="JoinButton" to="." method="_on_JoinButton_pressed"]
[connection signal="text_changed" from="InputIP" to="." method="_on_InputIP_text_changed"]
[connection signal="text_changed" from="InputPort" to="." method="_on_InputPort_text_changed"]
  [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/PauseMenu.gd" type="Script" id=1]

[node name="PauseMenu" type="Panel"]
pause_mode = 2
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -256.0
margin_top = -164.0
margin_right = 256.0
margin_bottom = 164.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="RespawnButton" type="Button" parent="."]
margin_left = 208.0
margin_top = 168.0
margin_right = 304.0
margin_bottom = 192.0
text = "Respawn"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ExitBtn" type="Button" parent="."]
margin_left = 64.0
margin_top = 168.0
margin_right = 160.0
margin_bottom = 192.0
text = "Exit"
__meta__ = {
"_edit_use_anchors_": false
}
[connection signal="pressed" from="RespawnButton" to="." method="_on_RespawnButton_pressed"]
[connection signal="pressed" from="ExitBtn" to="." method="_on_ExitBtn_pressed"]
      [gd_scene load_steps=8 format=2]

[ext_resource path="res://Scripts/Player.gd" type="Script" id=1]
[ext_resource path="res://head_material.tres" type="Material" id=2]
[ext_resource path="res://Scripts/PlayerHead.gd" type="Script" id=3]

[sub_resource type="CubeMesh" id=1]
size = Vector3( 1.2, 1.2, 1.2 )

[sub_resource type="CubeMesh" id=2]
size = Vector3( 1.1, 1.1, 0.9 )

[sub_resource type="CubeMesh" id=3]

[sub_resource type="CapsuleShape" id=4]
radius = 0.6
height = 1.5

[node name="Player" type="KinematicBody"]
script = ExtResource( 1 )

[node name="Head" type="MeshInstance" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2, 0 )
mesh = SubResource( 1 )
material/0 = null
script = ExtResource( 3 )

[node name="Camera" type="Camera" parent="Head"]

[node name="FaceMesh" type="MeshInstance" parent="Head"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, -0.2 )
mesh = SubResource( 2 )
material/0 = ExtResource( 2 )

[node name="Body" type="MeshInstance" parent="."]
transform = Transform( 0.5, 0, 0, 0, 1, 0, 0, 0, 0.5, 0, 1, 0 )
mesh = SubResource( 3 )
material/0 = null

[node name="BodyCollider" type="CollisionShape" parent="."]
transform = Transform( 1, 0, 0, 0, -1.62921e-07, -1, 0, 1, -1.62921e-07, 0, 1.35, 0 )
shape = SubResource( 4 )
[gd_scene load_steps=3 format=2]

[ext_resource path="res://Scenes/Chunk.tscn" type="PackedScene" id=1]
[ext_resource path="res://Scripts/VoxelWorld.gd" type="Script" id=3]

[node name="VoxelWorld" type="Spatial"]
script = ExtResource( 3 )

[node name="Chunk" parent="." instance=ExtResource( 1 )]
      GDSC   >      �        ������ڶ   ������Ҷ   �����Ŷ�   ���Ӷ���   ������Ŷ   ���������Ӷ�   ����Ӷ��   ���������Ӷ�   ����������¶   ������������Ӷ��   ���޶���   ���������϶�   ����Ŷ��   ��Ŷ   ������Ŷ   ������Ŷ   �������������Ŷ�   �����������Ŷ���   ���������Ŷ�   �����϶�   ���޶���   �����Ӷ�   ���������   ����   ���������������ڶ���   �����������޶���   �������Ŷ���   �����׶�   �߶�   ж��   ����������������Ӷ��   ��������Ŷ��   �������������   �����������බ��   ����������������   �����������   ����������������¶��   �������������Ӷ�   ����������������������Ŷ   �������������������   ���������϶�   �������������Ӷ�   ����Ӷ��   ��������Ŷ��   ��Ŷ   ���������������ڶ���   ߶��   �����Ҷ�   ����������������   ζ��   ϶��   ̶��   ������������Ҷ��   ��������߶��   ��������ڶ��   ���Ŷ���   ��������������ݶ   ��������ڶ��   �Ҷ�   ������������Ҷ��   ��������߶��   �������Ӷ���                                                                                                   '   	   .   
   /      2      3      4      :      A      H      O      V      ]      ^      _      w      �      �      �      �      �      �      �      �            C  !   D  "   k  #   �  $   �  %   �  &   �  '   �  (   �  )   �  *   �  +   �  ,   �  -   �  .   �  /   �  0   �  1   �  2     3     4     5     6     7     8      9   $  :   (  ;   ,  <   -  =   3  >   :  ?   A  @   H  A   O  B   V  C   W  D   `  E   g  F   p  G   z  H   {  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \     ]     ^     _     `   $  a   -  b   .  c   A  d   B  e   C  f   O  g   [  h   g  i   s  j   t  k   u  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y   �  z   �  {   �  |   �  }   �  ~           �   
  �     �     �     �   $  �   @  �   A  �   H  �   X  �   Y  �   d  �   q  �   r  �   y  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �   3YY;�  Y;�  �  PQYY:�  �  T�  Y:�  �  T�  Y:�  �  �  �  Y:�	  �  �  YY;�
  YYY;�  LMY;�  �  PQY;�  �  PQY;�  �  PQY;�  �  PQY;�  �  PQYYY:�  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  �  P�  R�  R�  QR�  P�  R�  R�  QR�  �  P�  R�  R�  QR�  P�  R�  R�  QMYYY:�  L�  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMR�  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMR�  �  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMR�  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMR�  �  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMR�  L�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QR�  P�  R�  R�  QMYMYY0�  PQV�  �
  W�  T�
  �  �  T�  P�  T�  Q�  �  �  �  T�  P�  �  �  Q�  )�  �K  P�  �  �  QV�  �  L�  M�  �  �  �  P�  P�  R�  R�  QR�  Q�  �  P�  P�  R�  R�  QR�  Q�  �  P�  P�  R�  R�  QR�  Q�  �  P�  P�  R�  R�  QR�  Q�  �  P�  P�  R�  R�  QR�  Q�  �  �  PQ�  YY0�  P�  QV�  &�  V�  �  PQ�  �  YY0�  PQV�  �  T�  P�  Q�  �  T�  P�  Q�  �  T�  P�  Q�  �  T�  P�  Q�  �  T�  P�  Q�  �  )�  �K  P�  QV�  &�  L�  MV�  )�  �K  P�  QV�  �  P�  P�  QR�  Q�  �  �  L�  T�   M�  �  �  L�  T�!  M�  �  �  L�  T�"  M�  �  �  L�  T�#  M�  �  �  &�
  T�$  PQV�  �
  T�%  P�  Q�  �
  T�&  P�  T�'  R�  QY�  W�(  �)  T�*  T�+  P�  QYYY0�  P�,  R�  QV�  �  &�-  P�,  �  L�  MQV�  .�  ;�.  �X  P�  Q�  �  )�  �K  P�  QV�  �  T�/  PP�,  �  L�  ML�  MQ�  Q�  �  T�/  P�  L�  MQ�  �  �  )�  L�  R�  R�  R�  R�  R�  MV�  �  T�/  P�.  �  Q�  �  �  T�/  PP�,  �  L�  ML�  MQ�  Q�  �  �  �  T�/  P�  P�  R�  QQ�  �  T�/  P�  P�  R�  QQ�  �  T�/  P�  P�  R�  QQ�  �  T�/  P�  P�  R�  QQYYY0�0  P�1  R�2  R�3  QV�  &�4  P�1  R�2  R�3  QV�  .�  L�5  P�1  R�2  R�3  QM�  .�  YY0�6  P�7  QV�  ;�,  �8  P�7  Q�  .�0  P�,  T�1  R�,  T�2  R�,  T�3  QYY0�-  P�,  QV�  .�0  P�,  T�1  R�,  T�2  R�,  T�3  QYY0�9  P�7  R�:  QV�  ;�,  �8  P�7  Q�  &�;  P�,  QV�  �  L�<  P�,  QM�:  �  �  �  �  .�  �  .YY0�  P�,  R�:  QV�  �  L�<  P�,  QM�:  �  �  �  YY0�4  P�1  R�2  R�3  QV�  .P�1  	�  �1  �  �2  	�  �2  �  �3  	�  �3  �  QYY0�;  P�,  QV�  .�4  P�,  T�1  R�,  T�2  R�,  T�3  QYY0�5  P�1  R�2  R�3  QV�  .�1  �  �  �2  �  �3  YY0�<  P�,  QV�  .�5  P�,  T�1  R�,  T�2  R�,  T�3  QYY0�  P�.  QV�  .�  P�  P�.  P�  �  QQR�  P�.  �  Q�  R�.  �  QYY0�8  P�7  QV�  ;�=  �  �  �  �  ;�1  �  P�7  T�1  R�=  Q�  ;�2  �  P�7  T�2  R�=  Q�  ;�3  �  P�7  T�3  R�=  Q�  �  �1  �  �  �2  �  �  �3  �  �  �  �1  �  P�1  Q�  �2  �  P�2  Q�  �3  �  P�3  Q�  .�  P�1  R�2  R�3  QYY`GDSC      	      �      ����ڶ��   �����Ķ�   �����϶�   ������Ŷ   �����������Ķ���   ������Ӷ   ������������Ŷ��   ���¶���   �������Ӷ���   ����������������Ķ��   �������Ŷ���   �����׶�   ���������Ŷ�   ���������¶�   ����¶��   ���������������������Ҷ�   �������ض���   ���������������۶���   �����ض�   ζ��   ϶��   ̶��   �������ض���   �������Ӷ���   �������ض���             Playing on server         Hosting server        debug_overlay_toggle      Position XYZ:
        
         Pitch:        Head      Yaw:                                                        	   (   
   /      0      7      ;      ?      C      D      M      R      S      Y      `      t      �      �      �      �      �      �      3YY;�  YY0�  PQV�  �  �  T�  �  �  �  W�  T�  �  �  &�  PQT�	  PQV�  W�  T�  �  YY0�
  P�  QV�  &�  V�  �  PQ�  �  PQY�  &�  T�  P�  QV�  �  �  YY0�  PQV�  W�  T�  �  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  YY0�  PQV�  W�  T�  �  �>  P�  T�  T�  P�  QT�  T�  Q�  �  W�  T�  �  �>  P�  T�  T�  T�  QY`               GDSC            u      ���Ӷ���   �����϶�   �����������Ķ���   �������Ӷ���   �������Ӷ���   �������Ӷ���   ��������������������Ҷ��   �����������������Ķ�   ������Ŷ   ��������Ҷ��   ����������Ķ   ���������Ķ�   ������Ŷ      res://Scenes/Player.tscn                               
            &      3      9   	   >   
   ?      E      Q      a      n      s      3YYY0�  PQV�  ;�  ?PQT�  PQ�  �  T�  P�>  P�  PQT�  PQQQ�  �  T�  P�  PQT�  PQQ�  �  T�  �  �  �	  P�  QYY0�
  PQV�  ;�  ?PQT�  PQ�  �  T�  P�>  P�  T�  L�  MQQ�  �  T�  P�  T�  L�  MQ�  �	  P�  QY`     GDSC                  ���Ӷ���   �����������Ķ���   ������Ŷ   ���������Ӷ�   ���������Ӷ�           �?                                                 3YY;�  Y8;�  LMYY:�  Y:�  �  Y`   GDSC       
   %   �      ���Ӷ���   �����϶�   ���Ķ���   �������Ӷ���   ������¶   ����������������Ҷ��   �Ҷ�   ������Ŷ   ������Ŷ   �����Ҷ�   �������Ӷ���   ����������Ķ   ���������Ӷ�   �������ö���   ���Ӷ���   ���Ӷ���   �������Ӷ���   �������¶���   ��������Ҷ��   ��������Ӷ��   ���¶���   ����������Ŷ   ���¶���   �����������������������¶���   ����   ��Ŷ   ������������Ķ��   ����   ���������������Ķ���   ��������Ӷ��   �ƶ�   ������������¶��      network_peer_connected        _player_connected         Player     
    connected     
   /root/Game        res://Scenes/Game.tscn        Hosting game on port          Error creating server         Joining game on       :                      	                        "      .   	   7   
   @      A      G      N      Z      g      h      i      r      |      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   3YY0�  PQV�  ;�  �  PQT�  PRR�  QYYY0�  P�  QV�  �?  P�  �>  P�  Q�  Q�  �  T�  T�	  P�  Q�  �
  P�  QT�  PQYY0�  PQV�  W�  T�  PQ�  ;�  ?P�  QT�  PQ�  �  PQT�  PQT�  P�  QYYY0�  P�  R�  QV�  �?  P�  �>  P�  QQ�  ;�  �  T�  PQ�  ;�  �  T�  P�  R�  Q�  &�  �  V�  �?  P�  Q�  .Y�  �  PQT�  P�  Q�  �  PQYY0�  P�  R�  QV�  �?  P�  �  �	  �>  P�  QQ�  ;�  �  T�  PQ�  �  T�  P�  R�  QY�  �  PQT�  P�  Q�  �  PQYY`         GDSC            _      ����ڶ��   ����϶��   �ƶ�   ���¶���   �����϶�   ���������¶�   ���������������������Ҷ�   ��������Ӷ��   ���������������������Ҷ�   ��������Ӷ��   �����������������������Ҷ���   �������¶���   �������������������������Ҷ�   	   127.0.0.1      �                                                            	       
   !      "      (      1      2      8      A      B      C      J      N      O      V      ]      3YY;�  YY8;�  Y8;�  �  YY0�  PQV�  �  �  PQYYY0�  PQV�  �  T�  P�  R�  QYY0�  PQV�  �  T�	  P�  R�  QYYY0�
  P�  QV�  �  �  YY0�  P�  QV�  �  �  P�  QY`        GDSC            �      ���Ӷ���   �����Ķ�   �����϶�   ������Ŷ   �����������Ķ���   ����¶��   �������������Ӷ�   �������������������   ������Ӷ   �������Ŷ���   �����׶�   ���������������������Ҷ�   ������������������   �������Ӷ���   �����Ҷ�   ������������������������Ҷ��   ������ض   ������������������Ҷ   ���������������Ķ���   ���¶���          
   pause_menu                                                             "   	   #   
   $      +      4      =      C      L      T      W      `      h      i      j      k      q      y      z      {      �      �      �      3YY;�  YY0�  PQV�  �  �  T�  �  �  T�  P�  T�  Q�  T�  YYY0�	  P�
  QV�  &�  T�  P�  QV�  T�  T�  �  &T�  V�  �  T�  P�  T�  Q�  �  PQT�  �  �  (V�  �  T�  P�  T�  Q�  �  PQT�  YYYY0�  PQV�  �  T�  T�  PQYYY0�  PQV�  �  PQT�  P�  Q�  �  PQT�  PQY`           GDSC   2      F   �     ������������϶��   ����޶��   ����Ҷ��   ���������Ķ�   ������������޶��   ����������������   ������϶   ����Ҷ��   �������϶���   �����϶�   ���������¶�   �������Ӷ���   �����¶�   ����¶��   ����������������Ķ��   ��������������������ض��   �������ض���   ϶��   �������Ӷ���   ζ��   ��������   ���Ҷ���   �������ζ���   �������������Ӷ�   ���������Ŷ�   ��Ŷ   ���������������۶���   ���������¶�   ���������������Ŷ���   ����׶��   ��Ķ   ����¶��   �������������Ҷ�   ����ᶶ�   ��������۶��   ����Ŷ��   ����嶶�   ��������   ����򶶶   ���������Ҷ�   ̶��   ���������������������Ҷ�   ����������Ķ   �������������Ӷ�   �涶   ������ض   �����ض�   ����������ڶ   ��������ڶ��   ����������ڶ   
              �?   
   VoxelWorld    ����Mb`?      ?   
   update_rot                     jump   
   update_pos                           	      
                        "   	   #   
   )      *      -      4      5      ;      F      G      N      T      Z      i      w      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '     (     )     *     +   &  ,   /  -   8  .   9  /   ?  0   I  1   Q  2   Y  3   a  4   b  5   o  6   u  7   v  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   3YY8;�  YY8;�  Y8;�  �  Y8;�  �  Y8;�  �  YY8;�  YY;�  Y;�  �  PQYY0�	  PQV�  �  �
  PQT�  P�  QYY0�  P�  QV�  &�  PQV�  &�  4�  V�  �  T�  �  T�  T�  �  �  �  ;�  �  T�  T�  �  �  �  �  �4  PZ�  W�  T�  T�  R�  Q�  �  �3  PZ�  W�  T�  T�  R�  Q�  W�  T�  P�  Q�  �  P�  R�  T�  RW�  T�  T�  QYYH0�  P�  QV�  �  �  YYH0�  P�  R�  QV�  W�  T�  T�  �  �  �  T�  �  YY0�  P�  QV�  &�  PQV�  ;�  �  PQ�  &�  T�   P�!  QV�  �  �"  T�#  L�  M�  &�  T�   P�$  QV�  �  �"  T�#  L�  M�  &�  T�   P�%  QV�  �  �"  T�#  L�  M�  &�  T�   P�&  QV�  �  �"  T�#  L�  MY�  �  T�  �  �  �  �  T�'  PQ�  �  �  T�  �  �  �  �  T�  �  T�  �  �  T�(  �  T�(  Y�  &�  T�)  P�	  Q�*  PQV�  �  T�  �  Y�  �  �+  P�  R�  T�,  QY�  �  P�
  R�  QYY0�-  PQV�  �  T�.  �  P�  R�  R�  Q�  �  �  P�  R�  R�  QS�  �  P�
  R�  QYY0�/  P�  QV�  �  T�0  P�  R�  QYY0�1  P�  QV�  �  T�0  P�  R�  QY`       GDSC            �      ������ڶ   �����Ķ�   ������ض   �����϶�   ���������¶�   ���������������Ŷ���   �����׶�   ����������������Ķ��   ����¶��   ���������������������Ҷ�   �����¶�   ������¶   ����������ڶ   �������ض���   ���������������۶���   ����Ŷ��   ̶��   ����������ڶ   ����������Ӷ   ��������Ҷ��   �����������������Ӷ�   ������������϶��   �����ض�   ����޶��   �������Ӷ���  {�G�z�?      break_voxel       place_voxel       BodyCollider                                                    	      
         "      (      1      8      <      M      V      ]      a      r      s      y      �      �      3YY;�  YY:�  YY0�  PQV�  �  �  PQYYY0�  P�  QV�  &�  PQV�  &�  T�	  P�  QV�  ;�
  �  PQ�  &�
  V�  �  T�  P�
  T�  �  T�  T�  �  Q�  &�  T�	  P�  QV�  ;�
  �  PQ�  &�
  V�  �  T�  P�
  T�  �  T�  T�  �  QYY0�  PQV�  ;�  �  PQT�  �  .�  T�  P�  T�  R�  T�  �  T�  T�  �  T�  RL�  T�  P�  QMQY` GDSC                   ������ڶ   ��������ڶ��   ��Ŷ   �Ҷ�   ����ݶ��                               3YY0�  P�  R�  QV�  W�  T�  P�  R�  QY`        GDST               ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��   ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��   ��p��   ���     p��     %���   X��    E  ��URR ]���UUUT��Q�`@@���  	  ��aR���  ��*��  <<����   ��    ��UUUU��U�@�  ��  -� ��  4x ��    5 ��   \ ��  &&	 ��  �\ ]���UUTU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU            [remap]

importer="texture"
type="StreamTexture"
path.s3tc="res://.import/debug_texture.png-6791ba1f89ff6a166665cf5d5da92763.s3tc.stex"
path.etc2="res://.import/debug_texture.png-6791ba1f89ff6a166665cf5d5da92763.etc2.stex"
metadata={
"imported_formats": [ "s3tc", "etc2" ],
"vram_texture": true
}

[deps]

source_file="res://debug_texture.png"
dest_files=[ "res://.import/debug_texture.png-6791ba1f89ff6a166665cf5d5da92763.s3tc.stex", "res://.import/debug_texture.png-6791ba1f89ff6a166665cf5d5da92763.etc2.stex" ]

[params]

compress/mode=2
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=true
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=1
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
     [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://debug_texture.png" type="Texture" id=1]

[resource]
albedo_texture = ExtResource( 1 )
    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[resource]
albedo_texture = ExtResource( 1 )
uv1_scale = Vector3( 3, 2, 1 )
              GDST@   @       ���m�Fn�+*"�   �*�    �:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU�� �������:+*UU���*Z    �:+*UUz���M���+*"   �*P   �:+*���� ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ �������������* � @�:+*V^ZZ �������:+*���� ������������ ������������ ������������ ������C����* ���������2U�� ������~�13u �� ���������2UV\X ���������2U�5% ������~�13] .� ���������2UV� ������C����� ������������ ������������ ������������ �������:+*ZZZZ �������:+*���� ������������ ������������ ������������ ���������2�� ��������wLTT\\ �������״���� ��������VTS�U ��������VT�@U �������״���� ��������wL55 ���������2TTVV ������������ ������������ ������������ �������:+*ZZZZ �������:+*���� ������������ ���������:U�5� ��������3U`
� ���������2�%�� ��������L\TUU �������״���� �������״���� �������״���� �������״���� ��������L5UU ���������2WX� ��������3U	�� ���������:UV\r ������������ �������:+*ZZZZ �������:+*���� ���������2UU� ��������VTaR\T �������״���� ������mwLXUUU �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ������mwL%UUU �������״���� ��������VTI�5 ���������2UUVT �������:+*ZZZZ �������:+*���� ���������	?��� ���������C\ra� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ���������C5�Is ���������	���� �������:+*ZZZZ �������:+*���� ������������ ��������2���� �������״���� ����������C ������^��9� �U ������}�WDUV\Z ��������wLUUU5 ��������wLUUU\ ������}�WDU�5� ������^��9 �U ������������� �������״���� ��������2RRRR ������������ �������:+*ZZZZ �������:+*���� ������������ ��������2���� �������״���� ���������:ccC ������׽�AUUU> ��������+���� ���������L5555 ���������L\\\\ ��������+��/? ������׽�AUUU� ���������:���� �������״���� ��������2RRRR ������������ �������:+*ZZZZ �������:+*���� ������������ ��������2���� �������״���� �������WD5UUU ������������� �������TWD���� ��������wL5�UU ��������wL\WUU �������TWD���� ������������ �������WD\UUU �������״���� ��������2RRRR ������������ �������:+*ZZZZ �������:+*���� ������������ ��������2�� ��������wL�
UU ���������\~ %% �������TWD���� ��������WLU� ���������\U� V ���������\U� � ��������WLUWTT �������TWD���? ���������\� XX ��������wL*�UU ��������2PPRR ������������ �������:+*ZZZZ �������:+*���� ������������ ������]��:%5 ������~�wLUUWT ��������wL%5�U ��������wLW �U ��������?  � ������;�WLTVWU ������;�WL��U ���������  � ��������wL� �U ��������wLX\WU ������~�wLUU� ������]��:PX\T ������������ �������:+*ZZZZ �������:+*���� ������������ ������St�?��� ������=װ"��	5 ��������WDUUWx �������״���� �������״���� �������״���� �������״���� �������״���� �������״���� ��������WDUU�- ���������*/�p\ ������St����� ������������ �������:+*ZZZZ �������:+*���� ������������ ������������ �������:m**��� ���������:�UU ��������*� �U ���������� � ��������LU � ��������LU� _ ���������� W ��������*� zU ���������:�^UU �������:m*���� ������������ ������������ �������:+*ZZZZ�*0  �:+*���� ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ ������������ �������������* ` 
 �:+*ZZ^V��o�i�+*"   �*    �N�:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU �������:+*��UU�*    �5�:+*�zUU�?���m�+*
"�   �������:+*U��� �������:+*U��� �������:+*U��� �������:+*U��� �������:+*U��� �������:+*U��� �������:+*U����!���?�:+*U^zj �������:+*���� ������������ ������{��*��� ������[��"rJ� ������[��"���� ������{��*WPss ������������ �������:+*jjjj �������c*���= ���������*�!�� ������������ �������״���� �������״���� ��������c/�� ���������*{H/? �������c*| �������[+*���� ������>��"���� ���������2��Z ������[�WDUUW� ������[�WDUU� ���������2��� ������>��"?�OO �������[+*~ �������:+*���� ��������"���� ���������B\ҋ� ��������WL�U ��������WL��VU ���������B5��� ��������"OOOO �������:+*jjjj �������:+*���� ������>װ"��� ������=טTXQ�� ��������wL�	rZ ��������wL_`�� ������=טT%EJ_ ������=װ"@OOk �������:+*jjjj �������:+*���� ��������� �?�� �������3���� �������wLUU~
 �������wLUU�� �������3���W ��������� ���� �������:+*jjjj�����o0�:+*���U �������:+*���U �������:+*���U �������:+*���U �������:+*���U �������:+*���U �������:+*���U�����:+*jz^UL�ȟ�����:+*���� ������y��2UU�# ������y��2UUc�L��?����:+*��� ���������2���� ������W�xL\UU� ������W�xL5UU ���������2^[[[ ������ڍ�2��%� ��������R3$�,� ��������R3�8� ������ڍ�2ZZXZL�������x�?��� ������8}�2�UU ������8}�2*�UUL������x��������������d�2U%���������d�2UX@@�����������2�	�U����������2j`zU�������Yu�:}��}���   �[qC������     ������            [remap]

importer="texture"
type="StreamTexture"
path.s3tc="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex"
path.etc2="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.etc2.stex"
metadata={
"imported_formats": [ "s3tc", "etc2" ],
"vram_texture": true
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.s3tc.stex", "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.etc2.stex" ]

[params]

compress/mode=2
compress/lossy_quality=1.0
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=true
flags/filter=true
flags/mipmaps=true
flags/anisotropic=false
flags/srgb=1
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
    [remap]

path="res://Scripts/Chunk.gdc"
        [remap]

path="res://Scripts/DebugOverlay.gdc"
 [remap]

path="res://Scripts/Game.gdc"
         [remap]

path="res://Scripts/Globals.gdc"
      [remap]

path="res://Scripts/Lobby.gdc"
        [remap]

path="res://Scripts/MainMenu.gdc"
     [remap]

path="res://Scripts/PauseMenu.gdc"
    [remap]

path="res://Scripts/Player.gdc"
       [remap]

path="res://Scripts/PlayerHead.gdc"
   [remap]

path="res://Scripts/VoxelWorld.gdc"
   �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name      
   voxel-game     application/run/main_scene          res://Scenes/Lobby.tscn    application/config/icon         res://icon.png     autoload/Globals$         *res://Scripts/Globals.gd      input/pause_menu`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      
   input/jump`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script         input/debug_overlay_toggle`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/break_voxel�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         input/place_voxel�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         input/next_item�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         input/prev_item�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      )   rendering/environment/default_environment          res://default_env.tres     