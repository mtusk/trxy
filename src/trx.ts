import { parseStringPromise } from 'xml2js';

const readFileText = async (file: File) => {
  const fileReader = new FileReader();

  const fileText = await new Promise<string>((resolve, reject) => {
    fileReader.onerror = () => {
      fileReader.abort();
      reject(new DOMException("Error reading file"));
    };

    fileReader.onload = () => {
      resolve(fileReader.result?.toString());
    };

    fileReader.readAsText(file);
  });

  return fileText;
}

export const readTestRun = async (file: File) => {
  const xml = await readFileText(file);
  const xmlObject = await parseStringPromise(xml);
  const testRun = mapTestRun(xmlObject);

  return testRun;
};

const mapTestRun = (obj: any) => {
  if (!obj.TestRun) { return undefined; }

  const testRun = {} as TestRun;

  testRun.id = obj.TestRun.$.id;
  testRun.name = obj.TestRun.$.name;

  if (obj.TestRun.Results) {
    testRun.results = obj.TestRun.Results[0].UnitTestResult.map(mapUnitTestResult);
  }

  if (obj.TestRun.TestDefinitions) {
    testRun.testDefinitions = obj.TestRun.TestDefinitions[0].UnitTest.map(mapUnitTest);
  }

  if (obj.TestRun.TestEntries) {
    testRun.testEntries = obj.TestRun.TestEntries[0].TestEntry.map(mapTestEntry);
  }

  if (obj.TestRun.ResultSummary) {
    testRun.resultSummary = mapResultSummary(obj.TestRun.ResultSummary[0]);
  }

  return testRun as TestRun;
};

const mapUnitTestResult = (obj: any) => {
  const unitTestResult = {} as UnitTestResult;

  unitTestResult.executionId = obj.$.executionId;
  unitTestResult.testId = obj.$.testId;
  unitTestResult.testName = obj.$.testName;
  unitTestResult.computerName = obj.$.computerName;
  unitTestResult.duration = obj.$.duration;
  unitTestResult.startTime = obj.$.startTime;
  unitTestResult.endTime = obj.$.endTime;
  unitTestResult.testType = obj.$.testType;
  unitTestResult.outcome = obj.$.outcome;
  unitTestResult.testListId = obj.$.testListId;
  unitTestResult.relativeResultsDirectory = obj.$.relativeResultsDirectory;

  if (obj.Output) {
    unitTestResult.output = mapOutput(obj.Output);
  }

  return unitTestResult as UnitTestResult;
};

const mapOutput = (obj: any) => {
  const errorInfo = {} as ErrorInfo;

  errorInfo.message = obj[0].ErrorInfo[0].Message[0];
  errorInfo.stackTrace = obj[0].ErrorInfo[0].StackTrace[0];

  const output: Output = {
    errorInfo
  };

  return output;
};

const mapUnitTest = (obj: any) => {
  const unitTest = {} as UnitTest;

  unitTest.id = obj.$.id;
  unitTest.name = obj.$.name;
  unitTest.storage = obj.$.storage;

  if (obj.Execution) {
    unitTest.execution = mapExecution(obj.Execution[0]);
  }

  if (obj.TestMethod) {
    unitTest.testMethod = mapTestMethod(obj.TestMethod[0]);
  }

  return unitTest as UnitTest;
};

const mapExecution = (obj: any) => {
  const execution = {} as Execution;

  execution.id = obj.$.id;

  return execution;
};

const mapTestMethod = (obj: any) => {
  const testMethod = {} as TestMethod;

  testMethod.codeBase = obj.$.codeBase;
  testMethod.adapterTypeName = obj.$.adapterTypeName;
  testMethod.className = obj.$.className;
  testMethod.name = obj.$.name;

  return testMethod;
};

const mapTestEntry = (obj: any) => {
  const testEntry = {} as TestEntry;

  testEntry.testId = obj.$.testId;
  testEntry.executionId = obj.$.executionId;

  return testEntry;
};

const mapResultSummary = (obj: any) => {
  const resultSummary = {} as ResultSummary;

  resultSummary.outcome = obj.$.outcome;

  if (obj.Counters) {
    resultSummary.counters = mapCounters(obj.Counters[0]);
  }

  return resultSummary;
};

const mapCounters = (obj: any) => {
  const counters = {} as Counters;

  counters.total = obj.$.total;
  counters.executed = obj.$.executed;
  counters.passed = obj.$.passed;
  counters.error = obj.$.error;
  counters.timeout = obj.$.timeout;
  counters.aborted = obj.$.aborted;
  counters.inconclusive = obj.$.inconclusive;
  counters.passButRunAborted = obj.$.passButRunAborted;
  counters.notRunnable = obj.$.notRunnable;
  counters.notExecuted = obj.$.notExecuted;
  counters.disconnected = obj.$.disconnected;
  counters.warning = obj.$.warning;
  counters.completed = obj.$.completed;
  counters.inProgress = obj.$.inProgress;
  counters.pending = obj.$.pending;

  return counters;
};

export interface TestRun {
  id: string;
  name: string;
  results: UnitTestResult[];
  testDefinitions: UnitTest[];
  testEntries: TestEntry[];
  resultSummary: ResultSummary;
}

export interface Times {
  creation: string;
  queuing: string;
  start: string;
  finish: string;
}

export interface UnitTestResult {
  executionId: string;
  testId: string;
  testName: string;
  computerName?: string;
  duration?: string;
  startTime?: string;
  endTime?: string;
  testType?: string;
  outcome?: string;
  testListId?: string;
  relativeResultsDirectory?: string;
  output?: Output;
}

export interface Output {
  errorInfo?: ErrorInfo
}

export interface ErrorInfo {
  message?: string;
  stackTrace?: string;
}

export interface UnitTest {
  id?: string;
  name?: string;
  storage?: string;
  execution?: Execution;
  testMethod?: TestMethod;
}

export interface Execution {
  id?: string;
}

export interface TestMethod {
  codeBase?: string;
  adapterTypeName?: string;
  className?: string;
  name?: string;
}

export interface TestEntry {
  testId?: string;
  executionId?: string;
}

export interface ResultSummary {
  outcome?: string;
  counters?: Counters;
}

export interface Counters {
  total?: number;
  executed?: number;
  passed?: number;
  error?: number;
  timeout?: number;
  aborted?: number;
  inconclusive?: number;
  passButRunAborted?: number;
  notRunnable?: number;
  notExecuted?: number;
  disconnected?: number;
  warning?: number;
  completed?: number;
  inProgress?: number;
  pending?: number;
}
