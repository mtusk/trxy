import React, { useState } from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import useMediaQuery from '@material-ui/core/useMediaQuery';
import { ThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import TestResults, { getTestResultsFromTestRun } from './test-results';
import Header from './header';
import { readTestRunFile, readTestRun } from '../trx';
import { TestResult } from './test-result';

const App: React.FC = () => {
  const prefersDarkMode = useMediaQuery('(prefers-color-scheme: dark)');

  const theme = React.useMemo(
    () =>
      createMuiTheme({
        palette: {
          type: prefersDarkMode ? 'dark' : 'light',
        },
      }),
    [prefersDarkMode],
  );

  const [fileName, setFileName] = useState<string>('trxy');
  const [testResults, setTestResults] = useState<TestResult[]>([]);

  (window.external as any).receiveMessage = async (message: string) => {
    console.log('Web page received message from desktop app.');

    // TODO is this the best place to subscribe? do we have to worry about multiple subscriptions accumulating?
    // TODO move this file-interop logic into its own file
    // const pickFileResponse: { fileName: string, fileText: string } = JSON.parse(message);

    // const testRun = await readTestRun(pickFileResponse.fileText);
    // const testResults = testRun === undefined
    //   ? [] as TestResult[]
    //   : getTestResultsFromTestRun(testRun);

    // console.log('read test results: ', testResults);
    // setFileName(pickFileResponse.fileName);
    // setTestResults(testResults);
  };

  const handlePickFile = () => {
    const pickFileRequest = {
      command: 'pickFile'
    };

    (window.external as any).sendMessage(JSON.stringify(pickFileRequest));
  };

  return (
    <React.Fragment>
      <ThemeProvider theme={theme}>
        <CssBaseline />
        {/* <Container maxWidth="lg"> */}
        <Header
          fileName={fileName}
          onPickFile={handlePickFile}
        // onFilePicked={handleFilePicked}
        />
        <TestResults testResults={testResults} />
        {/* </Container> */}
      </ThemeProvider>
    </React.Fragment>
  );
}

export default App;
