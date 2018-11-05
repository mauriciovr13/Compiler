// Generated from C:/Users/Maur�cio Vieira/IdeaProjects/Compiler/src\Java.g4 by ANTLR 4.7
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class JavaParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		DECIMAL_NUMBER=1, OCTAL_NUMBER=2, HEX_NUMBER=3, FLOAT_NUMBER=4, DOUBLE_NUMBER=5, 
		CHARACTER=6, STRING=7, ESPACE=8, COMMENT=9, BLOCK_COMMENT=10, NumberID=11, 
		HashtagID=12, CifraoID=13, ABSTRACT=14, BOOLEAN=15, BREAK=16, BYTE=17, 
		CASE=18, CATCH=19, CHAR=20, CLASS=21, CONST=22, CONTINUE=23, DEFAULT=24, 
		DO=25, DOUBLE=26, ELSE=27, ENUM=28, EXTENDS=29, FINAL=30, FINALLY=31, 
		FLOAT=32, FOR=33, IF=34, GOTO=35, IMPLEMENTS=36, IMPORT=37, INSTANCEOF=38, 
		INT=39, INTERFACE=40, LONG=41, NATIVE=42, NEW=43, PACKAGE=44, PRIVATE=45, 
		PROTECTED=46, PUBLIC=47, RETURN=48, SHORT=49, STATIC=50, STRICTFP=51, 
		SUPER=52, SWITCH=53, SYNCHRONIZED=54, THIS=55, THROW=56, THROWS=57, TRANSIENT=58, 
		TRY=59, VOID=60, VOLATILE=61, WHILE=62, STRING_TYPE=63, ASSIGNMENT_OPERATOR=64, 
		CONDITIONAL_OR=65, CONDITIONAL_AND=66, INCLUSIVE_OR=67, EXCLUSIVE_OR=68, 
		AND_EXPRESSION=69, EQUALITY=70, NOT_EQUALITY=71, RELATIONAL=72, SHIFT=73, 
		OPERATOR=74, DECREMENT=75, INCREMENT=76, UNARY_EXPRESSION=77, DIM_O=78, 
		DIM_C=79, CB_O=80, CB_C=81, BRACE_O=82, BRACE_C=83, DOT=84, DOT_C=85, 
		SYMBOL=86, ID=87;
	public static final int
		RULE_compilationUnit = 0;
	public static final String[] ruleNames = {
		"compilationUnit"
	};

	private static final String[] _LITERAL_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, "'abstract'", "'boolean'", "'break'", "'byte'", "'case'", 
		"'catch'", "'char'", "'class'", "'const'", "'continue'", "'default'", 
		"'do'", "'double'", "'else'", "'enum'", "'extends'", "'final'", "'finally'", 
		"'float'", "'for'", "'if'", "'goto'", "'implements'", "'import'", "'instanceof'", 
		"'int'", "'interface'", "'long'", "'native'", "'new'", "'package'", "'private'", 
		"'protected'", "'public'", "'return'", "'short'", "'static'", "'strictfp'", 
		"'super'", "'switch'", "'synchronized'", "'this'", "'throw'", "'throws'", 
		"'transient'", "'try'", "'void'", "'volatile'", "'while'", "'String'", 
		null, "'||'", "'&&'", "'|'", "'^'", "'&'", "'=='", "'!='", null, null, 
		null, "'--'", "'++'", null, "'['", "']'", "'{'", "'}'", "'('", "')'", 
		"'.'", "';'", "'@'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "DECIMAL_NUMBER", "OCTAL_NUMBER", "HEX_NUMBER", "FLOAT_NUMBER", 
		"DOUBLE_NUMBER", "CHARACTER", "STRING", "ESPACE", "COMMENT", "BLOCK_COMMENT", 
		"NumberID", "HashtagID", "CifraoID", "ABSTRACT", "BOOLEAN", "BREAK", "BYTE", 
		"CASE", "CATCH", "CHAR", "CLASS", "CONST", "CONTINUE", "DEFAULT", "DO", 
		"DOUBLE", "ELSE", "ENUM", "EXTENDS", "FINAL", "FINALLY", "FLOAT", "FOR", 
		"IF", "GOTO", "IMPLEMENTS", "IMPORT", "INSTANCEOF", "INT", "INTERFACE", 
		"LONG", "NATIVE", "NEW", "PACKAGE", "PRIVATE", "PROTECTED", "PUBLIC", 
		"RETURN", "SHORT", "STATIC", "STRICTFP", "SUPER", "SWITCH", "SYNCHRONIZED", 
		"THIS", "THROW", "THROWS", "TRANSIENT", "TRY", "VOID", "VOLATILE", "WHILE", 
		"STRING_TYPE", "ASSIGNMENT_OPERATOR", "CONDITIONAL_OR", "CONDITIONAL_AND", 
		"INCLUSIVE_OR", "EXCLUSIVE_OR", "AND_EXPRESSION", "EQUALITY", "NOT_EQUALITY", 
		"RELATIONAL", "SHIFT", "OPERATOR", "DECREMENT", "INCREMENT", "UNARY_EXPRESSION", 
		"DIM_O", "DIM_C", "CB_O", "CB_C", "BRACE_O", "BRACE_C", "DOT", "DOT_C", 
		"SYMBOL", "ID"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "JLexer/Java.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public JavaParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class CompilationUnitContext extends ParserRuleContext {
		public TerminalNode IMPORT() { return getToken(JavaParser.IMPORT, 0); }
		public CompilationUnitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compilationUnit; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof JavaListener ) ((JavaListener)listener).enterCompilationUnit(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof JavaListener ) ((JavaListener)listener).exitCompilationUnit(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof JavaVisitor ) return ((JavaVisitor<? extends T>)visitor).visitCompilationUnit(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CompilationUnitContext compilationUnit() throws RecognitionException {
		CompilationUnitContext _localctx = new CompilationUnitContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_compilationUnit);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(2);
			match(IMPORT);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3Y\7\4\2\t\2\3\2\3"+
		"\2\3\2\2\2\3\2\2\2\2\5\2\4\3\2\2\2\4\5\7\'\2\2\5\3\3\2\2\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}