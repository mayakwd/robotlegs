//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.enhancedLogging.impl;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.ILogTarget;
import robotlegs.bender.framework.api.LogLevel;

/**
 * A simple trace logger
 * @private
 */
class TraceLogTarget implements ILogTarget
{

	/*============================================================================*/
	/* Private Properties                                                         */
	/*============================================================================*/

	private var _messageParser = new LogMessageParser();

	private var _context:IContext;

	/*============================================================================*/
	/* Constructor                                                                */
	/*============================================================================*/

	/**
	 * Creates a Trace Log Target
	 * @param context Context
	 */
	public function new(context:IContext)
	{
		_context = context;
	}

	/*============================================================================*/
	/* Public Functions                                                           */
	/*============================================================================*/

	/**
	 * @inheritDoc
	 */
	public function log(source:Dynamic, level:UInt, timestamp:Int, message:String, params:Array<Dynamic> = null):Void
	{
		trace(timestamp // (START + timestamp)
			+ ' ' + LogLevel.NAME[level]
			+ ' ' + _context
			+ ' ' + source
			+ ' ' + _messageParser.parseMessage(message, params));
	}
}
