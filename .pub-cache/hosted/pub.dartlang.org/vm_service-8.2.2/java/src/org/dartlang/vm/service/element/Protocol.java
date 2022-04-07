/*
 * Copyright (c) 2015, the Dart project authors.
 *
 * Licensed under the Eclipse Public License v1.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */
package org.dartlang.vm.service.element;

// This is a generated file.

import com.google.gson.JsonObject;

/**
 * See getSupportedProtocols.
 */
@SuppressWarnings({"WeakerAccess", "unused"})
public class Protocol extends Element {

  public Protocol(JsonObject json) {
    super(json);
  }

  /**
   * The major revision of the protocol.
   */
  public int getMajor() {
    return getAsInt("major");
  }

  /**
   * The minor revision of the protocol.
   */
  public int getMinor() {
    return getAsInt("minor");
  }

  /**
   * The name of the supported protocol.
   */
  public String getProtocolName() {
    return getAsString("protocolName");
  }
}
