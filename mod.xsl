<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.user-ext-edit">
        <!-- className 'J_OXMod' required  -->
        <!--
		<slogan>我们掌握着改变世界的力量</slogan>
            <sex>X</sex>
            <img>http://i.oxm1.cc/uploads/git/wurui/img/2ajyf6sg4Tizdxut9oRw8uxC3pm.jpg</img>
            <uid>git/wurui</uid>
            <avatar>http://i.oxm1.cc/uploads/git/wurui/img/2ajyf6sh3Tizdxut8pRxh09Rq69.jpg</avatar>
            <nick>wurui</nick>
        -->
        <div class="J_OXMod oxmod-user-ext-edit" ox-mod="user-ext-edit">
        	<xsl:variable name="user" select="data/user-ext/i[1]"/>
            <xsl:variable name="gen_id" select="generate-id(.)"/>

            <form>
                <div style="display:none;">
                    <input type="file" name="file_avatar" id="user_avatar_{$gen_id}"/>
                    <input type="file" name="file_img" id="user_img_{$gen_id}"/>
                </div>
            	<input type="hidden" name="uid" value="{$user/uid}"/>
            	<div class="form-field">

            		<label class="avatar" for="user_avatar_{$gen_id}">
            			<xsl:if test="$user/avatar">
            				<xsl:attribute name="style">background-image:url(<xsl:value-of select="$user/avatar"/>)</xsl:attribute>
            			</xsl:if>
            		</label>
            		<input class="textinput" type="text" name="nick" value="{$user/nick}"/>
            		<br/><br/>
            		<select value="{$user/sex}" name="sex">
            			<option value="X">保密</option>
            			<option value="F">女</option>
            			<option value="M">男</option>
            		</select>
            	</div>
                <div class="form-field">
                    <input class="textinput" type="text" name="slogan" value="{$user/slogan}"/>
                </div>
            	
            	
            	<div class="form-field">
            		<label class="img" for="user_img_{$gen_id}">
            			<xsl:if test="$user/img">
            				<xsl:attribute name="style">background-image:url(<xsl:value-of select="$user/img"/>)</xsl:attribute>
            			</xsl:if>
            		</label>
            	</div>
                <div class="form-field">
                    <button class="bt-submit">提&#160;&#160;交</button>
                </div>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>
