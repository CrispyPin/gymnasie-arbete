GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex B      U      -��`�0��x�5�[    res://Scenes/DebugOverlay.tscn  `      S      U, ��"$DA��̲�    res://Scenes/Game.tscn  �            �"@ù'�}�jjOl�   res://Scenes/Lobby.tscn �      �      ����/_G�F��S�2   res://Scenes/PauseMenu.tscn �      a	      �m������h�#ռ�   res://Scenes/Player.tscn0      �      0��z��׮֜d��*    res://Scripts/Client.gd.remap    R      )       ���\����k;z�q   res://Scripts/Client.gdc !      �      ��`��?�\�.>�`�$   res://Scripts/DebugOverlay.gd.remap 0R      /       ��a�8��qv_��JT5�    res://Scripts/DebugOverlay.gdc  �'      \      �%k�5*��d�@S��   res://Scripts/Game.gd.remap `R      '       M�����*+��e��:�   res://Scripts/Game.gdc  P,      �      +z��Š{�p֊e   res://Scripts/Lobby.gd.remap�R      (       �z*���ə�fU�5	   res://Scripts/Lobby.gdc �.      �       �K����P�i$g	�R�    res://Scripts/PauseMenu.gd.remap�R      ,       b����O�ev0Kph�   res://Scripts/PauseMenu.gdc �5            W��#���]bY��e    res://Scripts/Player.gd.remap   �R      )       <y;�9Y;�k��S�   res://Scripts/Player.gdc�9      @      ���uVD�Јi7ބ�    res://Scripts/globals.gd.remap   S      *       ��4�2L�+�7�+=�   res://Scripts/globals.gdc   �@      �       E��m��6  ��-O��   res://default_env.tres  pA      �       um�`�N��<*ỳ�8   res://icon.png  PS      �      G1?��z�c��vN��   res://icon.png.import   �O      �      �����%��(#AB�   res://project.binary@`      �      Y?tL��$����[gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/DebugOverlay.gd" type="Script" id=1]

[node name="DebugOverlay" type="Panel"]
margin_right = 256.0
margin_bottom = 80.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Position" type="Label" parent="."]
margin_left = 8.0
margin_top = 8.0
margin_right = 120.0
margin_bottom = 56.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Velocity" type="Label" parent="."]
margin_left = 136.0
margin_top = 8.0
margin_right = 248.0
margin_bottom = 56.0
__meta__ = {
"_edit_use_anchors_": false
}
             [gd_scene load_steps=7 format=2]

[ext_resource path="res://Scripts/Game.gd" type="Script" id=1]
[ext_resource path="res://Scenes/PauseMenu.tscn" type="PackedScene" id=2]
[ext_resource path="res://Scenes/DebugOverlay.tscn" type="PackedScene" id=3]

[sub_resource type="CubeMesh" id=1]

[sub_resource type="BoxShape" id=2]
extents = Vector3( 16, 0.5, 16 )

[sub_resource type="PlaneMesh" id=3]

[node name="GameScene" type="Node"]
script = ExtResource( 1 )

[node name="Temp" type="Spatial" parent="."]

[node name="MeshInstance3" type="MeshInstance" parent="Temp"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 5.13987, 3.61299, 0.651503 )
mesh = SubResource( 1 )
material/0 = null

[node name="MeshInstance4" type="MeshInstance" parent="Temp"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -10.0285, 1.45876, -1.33748 )
mesh = SubResource( 1 )
material/0 = null

[node name="MeshInstance2" type="MeshInstance" parent="Temp"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -7.96942, 2.92762, 9.32718 )
mesh = SubResource( 1 )
material/0 = null

[node name="Floor" type="StaticBody" parent="Temp"]

[node name="CollisionShape" type="CollisionShape" parent="Temp/Floor"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.5, 0 )
shape = SubResource( 2 )

[node name="MeshInstance" type="MeshInstance" parent="Temp/Floor"]
transform = Transform( 16, 0, 0, 0, 1, 0, 0, 0, 16, 0, 0, 0 )
mesh = SubResource( 3 )
material/0 = null

[node name="PauseMenu" parent="." instance=ExtResource( 2 )]

[node name="DebugOverlay" parent="." instance=ExtResource( 3 )]
 [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/Lobby.gd" type="Script" id=4]

[node name="Lobby" type="Node"]
script = ExtResource( 4 )

[node name="Client" type="Node" parent="."]
pause_mode = 2

[node name="MainMenu" type="Panel" parent="."]
margin_left = 256.0
margin_top = 136.0
margin_right = 768.0
margin_bottom = 464.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="HostButton" type="Button" parent="MainMenu"]
margin_left = 192.0
margin_top = 56.0
margin_right = 320.0
margin_bottom = 80.0
text = "Host game"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="JoinButton" type="Button" parent="MainMenu"]
margin_left = 192.0
margin_top = 96.0
margin_right = 320.0
margin_bottom = 120.0
text = "Join game"

[node name="InputIP" type="LineEdit" parent="MainMenu"]
margin_left = 336.0
margin_top = 96.0
margin_right = 416.0
margin_bottom = 120.0
text = "127.0.0.1"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="InputPort" type="LineEdit" parent="MainMenu"]
margin_left = 336.0
margin_top = 56.0
margin_right = 416.0
margin_bottom = 80.0
text = "4242"

[node name="Status" type="Label" parent="."]
margin_left = 896.0
margin_top = 576.0
margin_right = 1024.0
margin_bottom = 600.0
text = "Idle"
valign = 1
__meta__ = {
"_edit_use_anchors_": false
}
[connection signal="pressed" from="MainMenu/HostButton" to="." method="_on_HostButton_pressed"]
[connection signal="pressed" from="MainMenu/JoinButton" to="." method="_on_JoinButton_pressed"]
              [gd_scene load_steps=3 format=2]

[ext_resource path="res://Scripts/PauseMenu.gd" type="Script" id=1]

[sub_resource type="CanvasItemMaterial" id=1]
blend_mode = 1

[node name="PauseMenu" type="Panel"]
pause_mode = 2
margin_left = 256.0
margin_top = 136.0
margin_right = 768.0
margin_bottom = 464.0
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ConnectionMenu" type="Panel" parent="."]
visible = false
self_modulate = Color( 0.52549, 0.878431, 0.494118, 1 )
material = SubResource( 1 )
margin_left = 32.0
margin_top = 16.0
margin_right = 480.0
margin_bottom = 152.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ConnectBtn" type="Button" parent="ConnectionMenu"]
margin_left = 32.0
margin_top = 32.0
margin_right = 128.0
margin_bottom = 56.0
text = "Connect"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="DisconnectBtn" type="Button" parent="ConnectionMenu"]
margin_left = 32.0
margin_top = 80.0
margin_right = 128.0
margin_bottom = 104.0
text = "Disconnect"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="labelStatus" type="Label" parent="ConnectionMenu"]
margin_left = 152.0
margin_top = 16.0
margin_right = 280.0
margin_bottom = 72.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="labelServerData" type="Label" parent="ConnectionMenu"]
margin_left = 296.0
margin_top = 16.0
margin_right = 424.0
margin_bottom = 72.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="EnterIP" type="TextEdit" parent="ConnectionMenu"]
margin_left = 160.0
margin_top = 96.0
margin_right = 288.0
margin_bottom = 120.0
text = "127.0.0.1"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="EnterPort" type="TextEdit" parent="ConnectionMenu"]
margin_left = 320.0
margin_top = 96.0
margin_right = 384.0
margin_bottom = 120.0
text = "4242"
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
               [gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/Player.gd" type="Script" id=1]

[sub_resource type="CapsuleMesh" id=1]

[sub_resource type="CapsuleShape" id=2]

[node name="Player" type="KinematicBody"]
script = ExtResource( 1 )

[node name="Camera" type="Camera" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 2, 0 )

[node name="MeshInstance" type="MeshInstance" parent="."]
transform = Transform( 1, 0, 0, 0, -1.62921e-07, -1, 0, 1, -1.62921e-07, 0, 1.5, 0 )
mesh = SubResource( 1 )
material/0 = null

[node name="BodyCollider" type="CollisionShape" parent="."]
transform = Transform( 1, 0, 0, 0, -1.62921e-07, -1, 0, 1, -1.62921e-07, 0, 1.5, 0 )
shape = SubResource( 2 )
       GDSC         +   �      ���Ӷ���   �ƶ�   ���¶���   ��������Ӷ��   �������Ӷ���   ���¶���   �����϶�   ����������������Ķ��   ����������Ķ   ������¶   ������ݶ   �����������������������¶���   ����   ������������¶��   ���������������Ķ���   ��������������������Ҷ��   ����Ķ��   �������Ӷ���   ���¶���   ������������������Ҷ   �Ҷ�   �����¶�   ��������������������߶��   ������������������Ҷ   ���������������������Ҷ�   ������������������Ҷ   �����������������������Ҷ���   �������������������������Ҷ�   �����¶�   	   127.0.0.1      �        network_peer_packet       _on_packet_received       connection_failed         _on_connection_failed         unknown error      '   ../PauseMenu/ConnectionMenu/labelStatus       Error connecting to server:    +   ../PauseMenu/ConnectionMenu/labelServerData        #   ../PauseMenu/ConnectionMenu/EnterIP    %   ../PauseMenu/ConnectionMenu/EnterPort                                                       	   #   
   '      6      7      =      F      O      X      Y      d      e      f      o      z      {      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   3YY;�  Y;�  �  YY0�  PQV�  �  PQT�  PQYY0�  PQV�  �  PQ�  �  PQT�  T�	  P�  RR�  QYY0�  PQV�  ;�
  �  T�  PQ�  �
  T�  P�  R�  Q�  �  PQT�  P�
  QY�  �
  T�	  P�  RR�  QYYY0�  P�  �  QV�  �  P�  QT�  �  �  YY0�  P�  R�  QV�  �  P�	  QT�  �  T�  PQYY0�  PQV�  �  PQYY0�  PQV�  �  PQT�  P�
  QYY0�  PQV�  �  PQYY0�  PQV�  �  �  P�  QT�  �  �?  P�  QYY0�  PQV�  �  �  P�  QT�  T�  PQ�  �?  P�  QY`GDSC            �      ����ڶ��   �����Ķ�   �����϶�   ������Ŷ   �����������Ķ���   ������Ӷ   �������Ŷ���   �����׶�   ���������Ŷ�   ���������ڶ�   ����¶��   ���������������������Ҷ�   �������ض���   ���¶���   ���������������۶���   �����ض�   ζ��   ϶��   ̶��   �������϶���   �������϶���             debug_overlay_toggle      Position XYZ:
        
         Velocity XYZ:
                                                      	      
   #      '      +      ,      5      :      ;      A      H      \      p      �      �      �      �      �      �      �      3YY;�  YY0�  PQV�  �  �  T�  �  �  YY0�  P�  QV�  &�  V�  �  PQ�  �	  PQY�  &�
  T�  P�  QV�  �  �  YY0�  PQV�  W�  T�  �  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  T�  Q�  YY0�	  PQV�  W�  T�  �  �  W�  T�  �>  P�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  Q�  �  W�  T�  �>  P�  T�  T�  T�  Q�  Y`    GDSC            u      ���Ӷ���   �����϶�   �����������Ķ���   �������Ӷ���   �������Ӷ���   �������Ӷ���   ��������������������Ҷ��   �����������������Ķ�   ������Ŷ   ��������Ҷ��   ����������Ķ   ���������Ķ�   ������Ŷ      res://Scenes/Player.tscn                               
            &      3      9   	   >   
   ?      E      Q      a      n      s      3YYY0�  PQV�  ;�  ?PQT�  PQ�  �  T�  P�>  P�  PQT�  PQQQ�  �  T�  P�  PQT�  PQQ�  �  T�  �  �  �	  P�  QYY0�
  PQV�  ;�  ?PQT�  PQ�  �  T�  P�>  P�  T�  L�  MQQ�  �  T�  P�  T�  L�  MQ�  �	  P�  QY`     GDSC          )   �      ���Ӷ���   ���¶���   �ƶ�   �����϶�   �������Ӷ���   ������¶   ����������������Ҷ��   �Ҷ�   ������Ŷ   ������Ŷ   �����Ҷ�   �������Ӷ���   ����������Ķ   ���������Ӷ�   �������ö���   ���Ӷ���   ���Ӷ���   �������Ӷ���   �������¶���   ��������Ҷ��   ���������������������Ҷ�   ���¶���   �����������������������¶���   ����   ��Ŷ   ������������Ķ��   ����   ���������������Ķ���   �����Ŷ�   ���¶���   ���������������������Ҷ�   ������������¶��   �     	   127.0.0.1         network_peer_connected        _player_connected         Player     
    connected        /root/GameScene       res://Scenes/Game.tscn        Hosting game on port                Error creating server         Hosting       Joining game on       :         Joined                                             !      "   	   #   
   *      6      ?      H      I      O      V      b      o      p      q      w      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   3YY;�  Y;�  �  YY0�  PQV�  �  PQT�  P�  RR�  QYYY0�  P�  QV�  �?  P�  �>  P�  Q�  Q�  �  T�	  T�
  P�  Q�  �  P�  QT�  PQYY0�  PQV�  W�  T�  PQ�  ;�  ?P�  QT�  PQ�  �  PQT�  PQT�  P�  QYYY0�  PQV�  �?  P�  �>  P�  QQ�  ;�  �  T�  PQ�  ;�  �  T�  P�  R�	  Q�  &�  �  V�  �?  P�
  Q�  .Y�  �  PQT�  P�  Q�  W�  T�  �  �  �  PQYYY0�  PQV�  �?  P�  �  �  �>  P�  QQ�  ;�  �  T�  PQ�  �  T�  P�  R�  Q�  �  PQT�  P�  Q�  W�  T�  �  �  �  PQY`         GDSC            �      ���Ӷ���   �����Ķ�   �����϶�   ������Ŷ   �����������Ķ���   ����¶��   �������������Ӷ�   �������������������   ������Ӷ   �������Ŷ���   �����׶�   ���������������������Ҷ�   ������������������   �������Ӷ���   �����Ҷ�   ������������������������Ҷ��   ���������������۶���   �����ض�   �������϶���   ������������������Ҷ   ���¶���          
   pause_menu                                                                      "   	   #   
   $      +      4      =      C      L      T      W      `      h      i      j      k      q      �      �      �      �      �      �      3YY;�  YY0�  PQV�  �  �  T�  �  �  T�  P�  T�  Q�  T�  YYY0�	  P�
  QV�  &�  T�  P�  QV�  T�  T�  �  &T�  V�  �  T�  P�  T�  Q�  �  PQT�  �  �  (V�  �  T�  P�  T�  Q�  �  PQT�  YYYY0�  PQV�  �  T�  T�  T�  �  P�  R�  R�  Q�  �  T�  T�  �  P�  R�  R�  QSYYY0�  PQV�  �  PQT�  PQY`    GDSC   (   	   /   B     ������������϶��   ����Ҷ��   ���������Ķ�   ������������޶��   ����������������   �������϶���   ������϶   �����¶�   ����¶��   ����������������Ķ��   ��������������������ض��   �������϶���   �������Ӷ���   ζ��   ��������   ϶��   �����׶�   �������ض���   �������ζ���   �����������ض���   ��Ŷ   ���������������۶���   ���������������Ŷ���   ����׶��   ��Ķ   ����¶��   �������������Ҷ�   ����ᶶ�   ��������۶��   ����Ŷ��   ����嶶�   ��������   ����򶶶   ���������Ҷ�   ̶��   ���������������������Ҷ�   ����������Ķ   �������������Ӷ�   �涶   �������������Ӷ�   
              �?  ����Mb`?      ?                   jump      set_position                   	                              #   	   (   
   )      0      6      <      J      X      j      }      �      �      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $      %     &     '     (     )   &  *   ,  +   -  ,   8  -   9  .   @  /   3YY8;�  Y8;�  �  Y8;�  �  Y8;�  �  YY;�  �  PQY;�  YY0�  P�  QV�  &�	  PQV�  &�  4�
  V�  �  P�  T�  T�  �  �  Q�  ;�  �  T�  T�  �  �  �  �  �4  PZ�  W�  T�  T�  R�  Q�  �  �3  PZ�  W�  T�  T�  R�  Q�  W�  T�  P�  QYYG0�  P�  QV�  �  �  YY0�  P�  QV�  &�	  PQV�  ;�  �  PQ�  &�  T�  P�  QV�  �  �  T�  L�  M�  &�  T�  P�  QV�  �  �  T�  L�  M�  &�  T�  P�  QV�  �  �  T�  L�  M�  &�  T�  P�   QV�  �  �  T�  L�  MY�  �  T�  �  �  �  �  T�!  PQ�  �  �  T�  �  �  �  �  T�  �  T�  �  �  T�"  �  T�"  Y�  &�  T�#  P�  Q�$  PQV�  �  T�  �  Y�  �  �%  P�  R�  T�&  QY�  �'  P�  R�  QY`GDSC                   ���Ӷ���   �����������Ķ���   ������Ŷ                               3YY;�  Y8;�  LMY`               [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://Scripts/Client.gdc"
       [remap]

path="res://Scripts/DebugOverlay.gdc"
 [remap]

path="res://Scripts/Game.gdc"
         [remap]

path="res://Scripts/Lobby.gdc"
        [remap]

path="res://Scripts/PauseMenu.gdc"
    [remap]

path="res://Scripts/Player.gdc"
       [remap]

path="res://Scripts/globals.gdc"
      �PNG
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
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG
      _global_script_classes             _global_script_class_icons             application/config/name      
   voxel-game     application/run/main_scene          res://Scenes/Lobby.tscn    application/config/icon         res://icon.png     autoload/globals$         *res://Scripts/globals.gd      input/pause_menu`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      
   input/jump`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script         input/debug_overlay_toggle`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      )   rendering/environment/default_environment          res://default_env.tres     