core.register_action("ssl-log-key", { "tcp-req", "http-req" }, function(txn)
	local dolog = false

	local ssl_session_id = txn.sc:hex(txn.sf:ssl_fc_session_id())
	local ssl_session_id_var = txn:get_var("sess.ssl_session_id")
	if ssl_session_id then
		if not ssl_session_id_var or ssl_session_id ~= ssl_session_id_var then
			dolog = true
			txn:set_var("sess.ssl_session_id", ssl_session_id)
		end
	elseif ssl_session_id_var then
		ssl_session_id = ssl_session_id_var
	end

	local ssl_session_key = txn.sc:hex(txn.sf:ssl_fc_session_key())
	local ssl_session_key_var = txn:get_var("sess.ssl_session_key")
	if ssl_session_key then
		if not ssl_session_key_var or ssl_session_key ~= ssl_session_key_var then
			dolog = true
			txn:set_var("sess.ssl_session_key", ssl_session_key)
		end
	elseif ssl_session_key_var then
		ssl_session_id = ssl_session_key_var
	end

	if dolog then
		txn:log(core.debug, "LOGFC CLIENT_RANDOM " .. txn.sc:hex(txn.sf:ssl_fc_client_random())  .. " " .. txn.sc:hex(txn.sf:ssl_fc_session_key()))
		txn:log(core.debug, "LOGFC CLIENT_HANDSHAKE_TRAFFIC_SECRET " .. txn.sc:hex(txn.sf:ssl_fc_client_random()) .. " " .. txn.sf:ssl_fc_client_handshake_traffic_secret())
		txn:log(core.debug, "LOGFC SERVER_HANDSHAKE_TRAFFIC_SECRET " .. txn.sc:hex(txn.sf:ssl_fc_client_random()) .. " " .. txn.sf:ssl_fc_server_handshake_traffic_secret())
		txn:log(core.debug, "LOGFC CLIENT_TRAFFIC_SECRET_0 " .. txn.sc:hex(txn.sf:ssl_fc_client_random()) .. " " .. txn.sf:ssl_fc_client_traffic_secret_0())
		txn:log(core.debug, "LOGFC SERVER_TRAFFIC_SECRET_0 " .. txn.sc:hex(txn.sf:ssl_fc_client_random()) .. " " .. txn.sf:ssl_fc_server_traffic_secret_0())
		txn:log(core.debug, "LOGFC EXPORTER_SECRET " .. txn.sc:hex(txn.sf:ssl_fc_client_random()) .. " " .. txn.sf:ssl_fc_exporter_secret())
	end
end)

core.register_action("ssl-log-key-bc", { "tcp-req", "http-req" }, function(txn)
	local dolog = false

	local ssl_session_id = txn.sc:hex(txn.sf:ssl_fc_session_id())
	local ssl_session_id_var = txn:get_var("sess.ssl_session_id")
	if ssl_session_id then
		if not ssl_session_id_var or ssl_session_id ~= ssl_session_id_var then
			dolog = true
			txn:set_var("sess.ssl_session_id", ssl_session_id)
		end
	elseif ssl_session_id_var then
		ssl_session_id = ssl_session_id_var
	end

	local ssl_session_key = txn.sc:hex(txn.sf:ssl_fc_session_key())
	local ssl_session_key_var = txn:get_var("sess.ssl_session_key")
	if ssl_session_key then
		if not ssl_session_key_var or ssl_session_key ~= ssl_session_key_var then
			dolog = true
			txn:set_var("sess.ssl_session_key", ssl_session_key)
		end
	elseif ssl_session_key_var then
		ssl_session_id = ssl_session_key_var
	end

	if dolog then
		txn:log(core.debug, "LOGBC CLIENT_RANDOM " .. txn.sc:hex(txn.sf:ssl_bc_client_random())  .. " " .. txn.sc:hex(txn.sf:ssl_bc_session_key()))
	end
end)

